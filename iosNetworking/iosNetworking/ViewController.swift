//
//  ViewController.swift
//  iosNetworking
//
//  Created by Varun Chillara on 11/19/19.
//  Copyright © 2019 Varun Chillara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ontapGet(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }
                catch{
                    print(error)
                }
            }
        }.resume()
        
    }
        
    
    @IBAction func ontapPost(_ sender: Any) {
        
        let info = ["name":"varun", "message":"hello"]
        
        let session = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
        
        var request = URLRequest(url: url)
        request.httpMethod = ("POST")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: info, options: []) else{return}
        request.httpBody = httpBody
        
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
        }.resume()
        
        
        
        
       
}

}

//
//  Model.swift
//  vidapp-onedaybuild
//
//  Created by Taylor Powell on 8/19/20.
//  Copyright © 2020 Taylor Wysong. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object (does all the "networking stuff")
        
        let session = URLSession.shared
        
        // Get a data task from the URLSession object (single call to API)
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
            
           
        }
        
        // Kick off the task
        dataTask.resume()
    }
    
}

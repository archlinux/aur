pipeline {
	agent any
	environment {
		VERSION = "8.13.1"
	}
	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
		
		stage('Run Shell Commands') {
			steps {
				sh '''
					updpkgsums
					ls -latrh
				'''
			}
		}
	}
}
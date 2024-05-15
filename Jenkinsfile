/* groovylint-disable LineLength */
pipeline {
    agent any
    environment {
        VERSION = ''
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Get Latest Version') {
            steps {
                sh '''
                    VERSION = $(curl https://api.github.com/repos/elastic/logstash/releases/latest | jq -r '.tag_name' | cut -c2-)
                '''
            }
        }
        stage('Update PKGBUILD') {
            steps {
                sh '''
                    sed -ie "s/pkgver=.*$/"pkgver=\\"$VERSION\\""/g" PKGBUILD
                    rm PKGBUILDe
                '''
            }
        }
        stage('Update Checksums') {
            steps {
                sh '''
                    updpkgsums
                '''
            }
        }
        stage('Make Package') {
            steps {
                sh '''
                    makepkg --printsrcinfo > .SRCINFO
                '''
            }
        }
    }
}

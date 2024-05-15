/* groovylint-disable GStringExpressionWithinString, LineLength */
pipeline {
    agent any
    environment {
        VERSION = """${sh(
                returnStdout: true,
                script: "curl https://api.github.com/repos/elastic/logstash/releases/latest | jq -r '.tag_name' | cut -c2- | tr -d '\n'"
            )}"""
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Update PKGBUILD') {
            steps {
                sh '''
                    sed -ie "s|pkgver=.*$|pkgver=${VERSION}|g" PKGBUILD
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
                    makepkg -s
                '''
            }
        }
        stage('Generate .SRCINFO') {
            steps {
                sh '''
                    makepkg --printsrcinfo > .SRCINFO
                '''
            }
        }
        stage('Cleanup - makepkg Artifacts') {
            steps {
                sh '''
                    rm -rf pkg src logstash-8*
                '''
            }
        }
        stage('Git Push') {
            steps {
                sh '''
                    git commit -am "Automated Commit: Update to ${VERSION}"
                '''
            }
        }
    }
    post {
        always {
            echo "Always Run"
            // deleteDir() /* clean up our workspace */
        }
        success {
            withCredentials([string(credentialsId: 'Discord_Webhook', variable: 'WEBHOOK_URL')]) {
                sh '''
                    curl -H "Content-Type: application/json" -d "{"content": "✅ Logstash v${VERSION} Released to AUR 🎆"}" "${WEBHOOK_URL}"
                '''
            }
        }
        failure {
            withCredentials([string(credentialsId: 'Discord_Webhook', variable: 'WEBHOOK_URL')]) {
                sh '''
                    curl -H "Content-Type: application/json" -d "{"content": "❌ Logstash v${VERSION} Pipeline Failed 🛠️"}" "${WEBHOOK_URL}"
                '''
            }
        }
    }
}

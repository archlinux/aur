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
        stage('Get Changelog') {
            steps {
                sh '''
                    curl https://api.github.com/repos/elastic/logstash/releases/latest | jq -r '.body' > ChangeLog
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
                withCredentials([sshUserPrivateKey(credentialsId: "Arch_AUR", keyFileVariable: 'KEY')]) {
                    sh '''
                        git config user.email "aman.iv0012@gmail.com"
                        git config user.name "Aman Gupta"
                        export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -i $KEY"
                        git branch release
                        git checkout master
                        git merge release
                        git remote add ssh-origin ssh://aur@aur.archlinux.org/logstash.git
                        git commit -am "Automated Release: Updated to v${VERSION}"
                        git push ssh-origin master
                    '''
                }
            }
        }
    }
    post {
        always {
            deleteDir() /* clean up our workspace */
        }
        success {
            withCredentials([string(credentialsId: 'Discord_Webhook', variable: 'WEBHOOK_URL')]) {
                sh '''
                    curl -H 'Content-Type: application/json' -d '{\"content\": \"✅ Logstash v'"$VERSION"' Released to AUR 🎆\"}' ${WEBHOOK_URL}
                '''
            }
        }
        failure {
            withCredentials([string(credentialsId: 'Discord_Webhook', variable: 'WEBHOOK_URL')]) {
                sh '''
                    curl -H 'Content-Type: application/json' -d '{\"content\": \"❌ Logstash v'"$VERSION"' Pipeline Failed 🛠️\"}' ${WEBHOOK_URL}
                '''
            }
        }
    }
}

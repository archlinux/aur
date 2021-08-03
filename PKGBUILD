# Maintainer: drzee <info@drzee.net>
pkgname=codedeploy-agent-bin
pkgver=1.3.2_1902
pkgrel=1
pkgdesc="AWS CodeDeploy is a deployment service that enables developers to automate the deployment of applications to instances and to update the applications as required."
arch=('x86_64')
url="https://aws.amazon.com/documentation/codedeploy/"
license=('APACHE')
groups=()
depends=('ruby2.7' 'systemd')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(https://aws-codedeploy-eu-west-1.s3-eu-west-1.amazonaws.com/releases/${pkgname%-bin}_${pkgver//_/-}_all.deb)
md5sums=('4a2697e9e3c022313705497caa197327')
noextract=()

prepare() {
  cd "$srcdir"
  tar -xf data.tar.gz
  
  sed -i 's/\/opt\/codedeploy-agent\/bin\/codedeploy-agent/\/usr\/bin\/ruby*2.7 \/opt\/codedeploy-agent\/lib\/codedeploy-agent.rb/' etc/init.d/codedeploy-agent.service
  sed -i '/^#!\/usr\/bin\/env ruby/a STDERR.puts \"Please use the systemctl utility to start,stop,restart or status the codedeploy-agent service. This script should not be used.\"\nexit(1)' opt/codedeploy-agent/bin/codedeploy-agent
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt/
  cp -R "${srcdir}"/opt/codedeploy-agent "${pkgdir}/opt/"

  install -Dm744 \
      "$srcdir"/etc/codedeploy-agent/conf/codedeployagent.yml \
      "$pkgdir"/etc/codedeploy-agent/conf/codedeployagent.yml

  install -Dm644 \
      "$srcdir"/etc/init.d/codedeploy-agent.service \
      "$pkgdir"/usr/lib/systemd/system/codedeploy-agent.service
      
}


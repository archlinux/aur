# Maintainer: drzee <info@drzee.net>
pkgname=codedeploy-agent-bin
pkgver=1.8.0_17
pkgrel=1
pkgdesc="AWS CodeDeploy is a deployment service that enables developers to automate the deployment of applications to instances and to update the applications as required. See: https://aws.amazon.com/documentation/codedeploy/ for details"
arch=('x86_64')
url="https://github.com/aws/aws-codedeploy-agent"
license=('APACHE')
groups=()
depends=('ruby' 'ruby-erb' 'ruby-base64')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(https://aws-codedeploy-eu-west-1.s3-eu-west-1.amazonaws.com/releases/${pkgname%-bin}_${pkgver//_/-}_all.deb)
# Checksums
sha256sums=('d42a3d5177d65ec5cadae03ce345c02af6864919e5cbbc55909b59bfc9fa52b8')
noextract=()
# We set options here to superseed the default makepkg.conf options. We dont whant debug build or strip debug info from the package. Its not relevant for a binary repackage of the upstream package.
options=(!debug !strip)

prepare() {
  cd "$srcdir"
  tar -xf data.tar.gz
  
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


# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.6.0
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=11')
makedepends=('maven' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('40969d09268c37febf80830ec31812c40d3f4eb8cd707be7181f220f7ad5b2a0')

build() {
  cd "${pkgname}-${pkgver}"
  mvn package -DskipTests
}

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  mkdir -p "${pkgdir}/usr/bin"
  unzip ${pkgname}-${pkgver}/eclair-node-gui/target/eclair-node-gui-${pkgver}-*-bin.zip -d "${pkgdir}/usr/share/java"
  mv "${pkgdir}/usr/share/java"/eclair* "${pkgdir}/usr/share/java"/eclair
  cd "${pkgdir}/usr/share/java"/eclair
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/eclair-cli.bash-completion" -t "${pkgdir}/etc/profile.d/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/eclair"
  ln -s /usr/share/java/eclair/bin/eclair-cli "${pkgdir}/usr/bin/eclair-cli"
  ln -s /usr/share/java/eclair/bin/eclair-node-gui.sh "${pkgdir}/usr/bin/eclair-node-gui"
  rm bin/eclair-node-gui.bat
}

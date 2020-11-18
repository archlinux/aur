# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.4.2
pkgrel=1
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=8' 'java-openjfx')
makedepends=('maven' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('530f091e2d7cefff39c84d1606c5c0b390a35b08ba87eab50b854f3ef1484009')

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

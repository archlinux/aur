# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.6.1
pkgrel=2
pkgdesc='A Scala implementation of the Lightning Network (GUI)'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=11')
makedepends=('maven' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7ca54626b4e9651b8dd86ef65500378848a1bd9c7d6183545f9dce921ed8c679')

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

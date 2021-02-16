# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq
pkgver=1.5.6
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk' 'bash')
makedepends=('jdk11-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bisq-network/bisq/archive/v${pkgver}.tar.gz"
	"https://github.com/bisq-network/bisq/releases/download/v${pkgver}/bisq-${pkgver}.tar.gz.asc"
	"bisq.desktop")
sha256sums=('da78b797a1d8244c5742ca7e0322f1311eaffb99733adb84d98dec4395761a08'
            'a0c5f73b7d6ee3f525265622d105ac047fa0759ae4676cc6e577213f98cd0519'
            '687d643fbe84660c3ebfe6270de98214f2e3ea791cb1d07d96d7ed889d61d406')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B') # Christoph Atteneder

_binname=Bisq
conflicts=("bisq-bin" "bisq-git")
provides=("bisq")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  msg2 "Building bisq..."
  ./gradlew clean :desktop:build -Dorg.gradle.java.home=/usr/lib/jvm/java-11-openjdk -x test
}

package() {
  # Install executable.
  install -d "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}-${pkgver}/desktop/build/app/"* "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}-${pkgver}/bisq-desktop" "${pkgdir}/opt/bisq/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}

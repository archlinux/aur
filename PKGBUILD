# Maintainer: David Parrish <daveparrish@tutanota.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=bisq
pkgver=1.7.0
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk-openjdk')
makedepends=('jdk11-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bisq-network/bisq/archive/v${pkgver}.tar.gz"
	"https://github.com/bisq-network/bisq/releases/download/v${pkgver}/bisq-${pkgver}.tar.gz.asc"
	"bisq.desktop")
sha256sums=('26d0b127ecd77109920a595ef5a0e4577fb04227949f80a5dedbde15fd98ba6c'
            'd39838d93d4b0b3bd266493425370902c020b377cd1a27f0d71e176c10d9d310'
            '20d24db040983a6139e3300db7824b08b3e106150cb155480409b1ab7de68d17')
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

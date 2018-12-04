# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('java-openjfx')
makedepends=('maven' 'jdk10-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bisq-network/bisq-desktop.git#tag=v${pkgver}"
        "bisq.desktop")
sha256sums=('SKIP'
            '20d24db040983a6139e3300db7824b08b3e106150cb155480409b1ab7de68d17')

build() {
  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq..."
  ./gradlew build -Dorg.gradle.java.home=/usr/lib/jvm/java-10-openjdk
}

package() {
  # Install executable.
  install -d "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}/desktop/build/app/"* "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}/bisq-desktop" "${pkgdir}/opt/bisq/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}

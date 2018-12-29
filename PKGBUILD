# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq
pkgver=0.9.1
pkgrel=2
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('java-runtime' 'bash')
makedepends=('git' 'maven' 'jdk10-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bisq-network/bisq-desktop.git#tag=v${pkgver}"
        "bisq.desktop")
sha256sums=('SKIP'
            '3560a5cfd097c644874af634725f6063674ffc93ac48118846cc693490cee6bc')

_binname=Bisq
conflicts=("bisq-bin" "bisq-git")
provides=("bisq")

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

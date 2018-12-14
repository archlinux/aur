# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-git
pkgver=0.9.1.r1.g517429e8d
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk10-openjdk' 'java-openjfx')
makedepends=('git' 'maven' 'jdk10-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bisq-network/bisq.git#branch=master"
        "bisq.desktop")
sha256sums=('SKIP'
            'af003d530a2fe5c898c7da6b31d4240d054f71fd2d68f5d73c8a295d9650f263')

conflicts=("bisq" "bisq-bin")

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq..."
  # Make sure to use jdk10 for compiling
  export PATH="/usr/lib/jvm/java-10-openjdk/bin/:$PATH"
  ./gradlew build
}

package() {
  # Install executable.
  install -d "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}/desktop/build/app/"* "${pkgdir}/opt/bisq"
  cp "${srcdir}/${pkgname}/bisq-desktop" "${pkgdir}/opt/bisq/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}/desktop/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}

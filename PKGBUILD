# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-git
pkgver=0.8.0.r1.ged3e90c2d
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bisq.network"
license=('AGPL3')
depends=('java-openjfx')
makedepends=('maven' 'jdk8-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bisq-network/bisq-desktop.git#branch=master"
        "bisq.desktop")
sha256sums=('SKIP'
            'af003d530a2fe5c898c7da6b31d4240d054f71fd2d68f5d73c8a295d9650f263')

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq..."
  ./gradlew build
}

package() {
  # Install executable.
  install -d "${pkgdir}/opt/bisq"
  cp -r "${srcdir}/${pkgname}/build/app/"/* "${pkgdir}/opt/bisq"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/bisq/bin/bisq-desktop" "${pkgdir}/usr/bin/bisq-desktop"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}

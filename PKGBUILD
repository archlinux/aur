# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=bitsquare-git
pkgver=v0.3.1.r6.g6db8157
pkgrel=1
pkgdesc="Bitsquare is a cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bitsquare.io/"
license=('AGPL3')
depends=('bash' 'java-runtime-openjdk=8')
makedepends=('maven' 'openjfx')
provides=('bitsquare')
source=("${pkgname}::git+https://github.com/bitsquare/bitsquare.git"
  "bitsquare.sh"
  "bitsquare.desktop")
sha256sums=('SKIP'
            'b2e5e85f842f0bc9910087d62f78f5fd9fc1b6232849b59e785acbec5d8955cf'
            '15592a05a2a4d6cb65c757e9eec5e3818bf38e7397a3b98e7651a8a3b51f9ba9')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mvn package
}

package() {
  # Install executable. 
  install -D -m755 "bitsquare.sh" "${pkgdir}/usr/bin/bitsquare"
  install -D -m644 "${srcdir}/${pkgname}/gui/target/shaded.jar" "${pkgdir}/usr/share/java/bitsquare/shaded.jar"

  # Install desktop launcher.
  install -Dm644 bitsquare.desktop "${pkgdir}/usr/share/applications/bitsquare.desktop"
  install -Dm644 "${srcdir}/${pkgname}/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bitsquare.png"
}

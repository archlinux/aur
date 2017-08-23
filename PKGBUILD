# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.8.0
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${pkgname}"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets')
makedepends=('make')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=('84919d51e1859ad6fc328b8656ba04db415db745d387fb06621cc520ff494546')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}-beta"

    sed -i "s/#define APP_VERSION \"git\"/#define APP_VERSION \"v${pkgver}-beta\"/" ./src/version.h
}

build() {
    cd "${pkgname}-${pkgver}-beta"

    mkdir build
    cd build/

    qmake-qt5 ../Moolticute.pro                     \
              PREFIX=/usr                           \
              QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
              QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

    make
}

package() {
    cd "${pkgname}-${pkgver}-beta/build/"

    make INSTALL_ROOT="${pkgdir}/" install
}

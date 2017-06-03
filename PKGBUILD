# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.7.2
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
sha256sums=('cc2d1be10ccc65fc835aeaab7f2b3a2953012dbfb11a4b32d088c985c79d479d')

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

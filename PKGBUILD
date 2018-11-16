# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.30.1
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets'
         'hicolor-icon-theme')
makedepends=('make'
             'qt5-tools')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3ae99813463c942f094d220e5e551180463e749f174daa47eb0daf95bb6b2578')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i "s/#define APP_VERSION \"git\"/#define APP_VERSION \"v${pkgver}\"/" ./src/version.h
}

build() {
    cd "${pkgname}-${pkgver}"

    mkdir build
    cd build/

    qmake-qt5 ../Moolticute.pro                     \
              PREFIX=/usr                           \
              QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
              QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

    make
}

package() {
    cd "${pkgname}-${pkgver}/build/"

    make INSTALL_ROOT="${pkgdir}/" install
}

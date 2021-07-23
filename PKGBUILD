# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.50.1
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
url="https://github.com/mooltipass/moolticute"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev' ## AUR
         'qt5-base'
         'qt5-websockets'
         'hicolor-icon-theme')
makedepends=('qt5-tools')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d284ffe26c78a4c519148b598f82657fb2f50b85e195468c336b49f26d813c17')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i "/#define APP_VERSION/s/git/v$pkgver/" src/version.h
}

build() {
    cd "${pkgname}-${pkgver}"

    mkdir -p build
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

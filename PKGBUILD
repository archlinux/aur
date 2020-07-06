# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.44.0
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mooltipass/moolticute/archive/v0.44.0.tar.gz")
sha256sums=('ec14982e0c5d855e1eddec591ce4718a48ee643090935f92052378a2ea1634b6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i "s/#define APP_VERSION \"git\"/#define APP_VERSION \"v${pkgver}\"/" ./src/version.h
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

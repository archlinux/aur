# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.6.0
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
sha256sums=('2cf52d1d420964c3ba82906b006cbb43830beb7b4a22c8e6598232e6bef91fa5')

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

    # temporary remove udev rules until fully merged into mooltipass-udev
    # this should be removed on the next moolticute release
    rm -rf "${pkgdir}/usr/lib/udev/"
}

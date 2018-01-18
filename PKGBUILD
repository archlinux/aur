# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute
pkgver=0.11.5
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/mooltipass/${pkgname}"
license=('GPL3')

depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets'
         'hicolor-icon-theme')
makedepends=('make'
             'qt5-tools')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=('55cd38481de45abbf1afd3ecf714bac5c4ccba2e03aa30d7bb7b07e58a82f06f')

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

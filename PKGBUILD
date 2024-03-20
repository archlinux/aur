# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: Abigail G <dev@kb6.ee>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=js8call
pkgver=2.2.0
pkgrel=5
pkgdesc="Software for ragchewing and message-passing based on WSJT-X"
arch=('i686' 'x86_64')
url="https://bitbucket.org/widefido/js8call/"
license=('GPL-3.0-only')
makedepends=(cmake asciidoc asciidoctor gcc-fortran)
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat libpulse libpng fftw hamlib)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://bitbucket.org/widefido/$pkgname/get/v$pkgver-ga.tar.gz)
sha1sums=('81bb9d0483e569fe4bba24f0f724ecfb9de70046')

prepare() {
    mv "$srcdir"/widefido-js8call* "$srcdir"/$pkgname-$pkgver
    mkdir -p "$srcdir"/build
}

build() {
    cd "$srcdir"/build
    cmake -Wno-dev -Dhamlib_LIBRARY_DIRS=/usr/lib/ -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr -DCMAKE_BUILD_TYPE=Release "$srcdir"/$pkgname-$pkgver
    cmake --build .
}

package() {
    cd "${srcdir}"/build
    sed -i.bak0 '\%list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES%,+7d' cmake_install.cmake
    sed -i.bak1 's%file(INSTALL DESTINATION "/usr/share/applications"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications"%' cmake_install.cmake
    sed -i.bak2 's%file(INSTALL DESTINATION "/usr/share/pixmaps"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pixmaps"%' cmake_install.cmake
    sed -i.bak3 '\%file(INSTALL DESTINATION "/usr/bin"%d' cmake_install.cmake
    cmake --build . --target install
}

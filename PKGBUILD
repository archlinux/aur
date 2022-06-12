# Maintainer: Brian Salcedo <brian@salcedo.tech>
# Contributor: Abigail G <dev@kb6.ee>
pkgname=js8call
pkgver=2.2.0
pkgrel=5
pkgdesc="Software for ragchewing and message-passing based on WSJT-X"
arch=('i686' 'x86_64')
url="https://bitbucket.org/widefido/js8call/"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor gcc-fortran)
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat libpulse libpng fftw hamlib)
# depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat gcc-fortran libpulse libpng fftw hamlib-git)
# source=($pkgname-$pkgver.tar.gz::https://bitbucket.org/widefido/$pkgname/get/v$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://bitbucket.org/widefido/$pkgname/get/v$pkgver-ga.tar.gz)
md5sums=('000b6d7da83f49b85560fab14e09db21')

build() {
    mv $srcdir/widefido-js8call* $srcdir/$pkgname-$pkgver
    # echo "add_compile_definitions(JS8_USE_HAMLIB_THREE)" >> $srcdir/$pkgname-$pkgver/CMakeLists.txt
    mkdir -p $srcdir/build
    cd $srcdir/build
    cmake -Wno-dev -Dhamlib_LIBRARY_DIRS=/usr/lib/ -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCMAKE_BUILD_TYPE=Release $srcdir/$pkgname-$pkgver
    cmake --build .
}

package() {
    cd ${srcdir}/build
    sed -i.bak0 '\%list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES%,+7d' cmake_install.cmake
    sed -i.bak1 's%file(INSTALL DESTINATION "/usr/share/applications"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications"%' cmake_install.cmake
    sed -i.bak2 's%file(INSTALL DESTINATION "/usr/share/pixmaps"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pixmaps"%' cmake_install.cmake
    sed -i.bak3 '\%file(INSTALL DESTINATION "/usr/bin"%d' cmake_install.cmake
    cmake --build . --target install
}

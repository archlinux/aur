# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: Abigail G <dev@kb6.ee>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=js8call
pkgver=2.3.1
pkgrel=1
pkgdesc="Software for ragchewing and message-passing based on WSJT-X"
arch=('i686' 'x86_64')
url="https://github.com/js8call/js8call"
license=('GPL-3.0-only')
makedepends=(cmake asciidoc asciidoctor)
depends=(fftw glibc hamlib libgcc libstdc++ readline qt6-base qt6-multimedia qt6-serialport)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha1sums=('75b7b331360773dba328fa4319c5227777e93302')

build() {
    cd "$srcdir"
    cmake \
	-B build \
        -Wno-dev \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Dhamlib_LIBRARY_DIRS=/usr/lib/ \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -S "$srcdir"/$pkgname-$pkgver
    cmake --build build
}

package() {
    cd "${srcdir}"/build
    sed -i.bak0 '\%list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES%,+7d' cmake_install.cmake
    sed -i.bak1 's%file(INSTALL DESTINATION "/usr/share/applications"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications"%' cmake_install.cmake
    sed -i.bak2 's%file(INSTALL DESTINATION "/usr/share/pixmaps"%file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pixmaps"%' cmake_install.cmake
    sed -i.bak3 '\%file(INSTALL DESTINATION "/usr/bin"%d' cmake_install.cmake
    cmake --install .
}

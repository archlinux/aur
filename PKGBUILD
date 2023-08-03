# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=openexr
pkgname=lib32-openexr
pkgver=3.1.9
pkgrel=1
pkgdesc="An high dynamic-range image file format library (32-bit)"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-imath' 'lib32-zlib' 'openexr')
makedepends=('cmake')
conflicts=('lib32-ilmbase')
replaces=('lib32-ilmbase')
source=(https://github.com/openexr/openexr/archive/v$pkgver/$_basename-$pkgver.tar.gz)
sha256sums=('103e902d3902800ab07b5f3a298be7afd2755312737b2cdbfa01326ff99dac07')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -B build -S $_basename-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DOPENEXR_BUILD_UTILS=false

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/share"
    rm -r "${pkgdir}/usr/bin"

    install -D -m644 "$srcdir"/$_basename-$pkgver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=openexr
pkgname=lib32-openexr
pkgver=2.4.1
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'openexr')
makedepends=('cmake' 'lib32-fltk' 'lib32-freeglut')
conflicts=('lib32-ilmbase')
replaces=('lib32-ilmbase')
source=($_basename-$pkgver.tar.gz::"https://github.com/openexr/openexr/archive/v$pkgver.tar.gz"
        openexr-pc-prefix.patch::"https://github.com/AcademySoftwareFoundation/openexr/commit/0b26a9de.patch")
sha256sums=('3ebbe9a8e67edb4a25890b98c598e9fe23b10f96d1416d6a3ff0732e99d001c1'
            'f20d7588badb679828816e0ada201705b7d1cc5a4d82df3d586707a792b10950')

prepare() {
    cd $_basename-$pkgver

    patch -p1 -i ../openexr-pc-prefix.patch # Fix prefix in pc file
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    mkdir -p build

    cd build

    cmake ../$_basename-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DPYILMBASE_ENABLE=false \
        -DOPENEXR_BUILD_UTILS=false

    make
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/share"

    install -D -m644 "$srcdir"/$_basename-$pkgver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

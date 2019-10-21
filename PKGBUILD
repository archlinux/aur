# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=openexr
pkgname=lib32-openexr
pkgver=2.4.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'openexr')
makedepends=('cmake' 'lib32-fltk' 'lib32-freeglut')
conflicts=('lib32-ilmbase')
replaces=('lib32-ilmbase')
source=($_basename-$pkgver.tar.gz::"https://github.com/openexr/openexr/archive/v$pkgver.tar.gz")
sha256sums=('4904c5ea7914a58f60a5e2fbc397be67e7a25c380d7d07c1c31a3eefff1c92f1')

prepare() {
    cd $_basename-$pkgver

    # Take DESTDIR into account when creating symlinks
    sed -e 's|chdir ${CMAKE_INSTALL_FULL_LIBDIR}|chdir \\$ENV\\{DESTDIR\\}${CMAKE_INSTALL_FULL_LIBDIR}|' \
        -i OpenEXR/config/LibraryDefine.cmake -i IlmBase/config/LibraryDefine.cmake
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

    # Fix pc include path
    sed -e 's|=include|=${prefix}/include|g' -e 's|=lib|=${prefix}/lib|g' \
        -i "$pkgdir"/usr/lib32/pkgconfig/OpenEXR.pc -i "$pkgdir"/usr/lib32/pkgconfig/IlmBase.pc
}

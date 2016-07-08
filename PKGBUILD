pkgname=mingw-w64-libarchive
pkgver=3.2.1
pkgrel=2
pkgdesc="Multi-format archive and compression library (mingw-w64)"
arch=('any')
url="http://www.libarchive.org/"
license=('BSD')
makedepends=('mingw-w64-cmake' 'ninja')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.libarchive.org/downloads/libarchive-3.2.1.tar.gz")
md5sums=('afa257047d1941a565216edbf0171e72')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    unset LDFLAGS
    cd "$srcdir/libarchive-$pkgver/"
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake -GNinja \
                -DCMAKE_BUILD_TYPE=Release \
                -DENABLE_TEST=OFF \
                ..
        ninja
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/libarchive-$pkgver/build-${_arch}"
        DESTDIR="${pkgdir}" ninja install
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}

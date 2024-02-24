pkgname=mingw-w64-libpng
pkgver=1.6.43
_apngver=$pkgver
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw-w64)"
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-configure')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz")
sha256sums=('6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libpng-$pkgver"
}

build() {
  cd "$srcdir/libpng-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libpng-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

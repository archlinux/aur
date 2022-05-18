pkgname=mingw-w64-libiconv
pkgver=1.17
pkgrel=1
arch=(any)
pkgdesc="Provides GNU libiconv.so and libcharset.so (mingw-w64)"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
license=("LGPL")
url="http://www.gnu.org/software/libiconv/"
source=("http://ftp.gnu.org/pub/gnu/libiconv/libiconv-$pkgver.tar.gz")
sha256sums=('8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "$srcdir/libiconv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-nls
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libiconv-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install -j1
    rm -r "$pkgdir"/usr/${_arch}/share/
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


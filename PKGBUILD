
pkgname=mingw-w64-nlopt
pkgver=2.4.2
pkgrel=2
pkgdesc="nonlinear optimization library (mingw-w64)"
arch=(any)
url="http://ab-initio.mit.edu/wiki/index.php/NLopt"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://ab-initio.mit.edu/nlopt/nlopt-$pkgver.tar.gz")
md5sums=('d0b8f139a4acf29b76dbae69ade8ac54')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/nlopt-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-python \
      --without-guile \
      --without-octave
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/nlopt-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

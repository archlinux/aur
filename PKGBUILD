
pkgname=mingw-w64-qhull
pkgver=2015.2
pkgrel=1
pkgdesc="A general dimension code for computing convex hulls and related structures (mingw-w64)"
arch=('any')
url="http://www.qhull.org/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.qhull.org/download/qhull-2015-src-7.2.0.tgz")
md5sums=('e6270733a826a6a7c32b796e005ec3dc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "qhull-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() { 
  for _arch in ${_architectures}; do
    cd "$srcdir/qhull-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/man "$pkgdir"/usr/${_arch}/doc
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


pkgname=mingw-w64-qhull
pkgver=2012.1
pkgrel=1
pkgdesc="A general dimension code for computing convex hulls and related structures (mingw-w64)"
arch=('any')
url="http://www.qhull.org/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.qhull.org/download/qhull-$pkgver-src.tgz")
md5sums=('d0f978c0d8dfb2e919caefa56ea2953c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "qhull-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
  done
}

package() { 
  for _arch in ${_architectures}; do
    #cd "$srcdir/qhull-${pkgver}/build-${_arch}-static"
    #make install DESTDIR="$pkgdir"
    cd "$srcdir/qhull-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/man "$pkgdir"/usr/${_arch}/doc
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

  #make DESTDIR="$pkgdir" install

}

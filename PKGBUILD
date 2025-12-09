pkgname=mingw-w64-qhull
pkgver=2020.2
_pkgver=8.0.2
pkgrel=1
pkgdesc="A general dimension code for computing convex hulls and related structures (mingw-w64)"
arch=('any')
url="http://www.qhull.org/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://www.qhull.org/download/qhull-${pkgver%.*}-src-$_pkgver.tgz)
sha256sums=('b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "qhull-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() { 
  for _arch in ${_architectures}; do
    cd "$srcdir/qhull-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

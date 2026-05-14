pkgname=mingw-w64-cddlib
pkgver=0.94n
pkgrel=1
pkgdesc="C library implementing Double Description Method for convex polyhedra (mingw-w64)"
arch=('any')
url="https://www.inf.ethz.ch/personal/fukudak/cdd_home/"
license=(GPL-2.0-only)
depends=('mingw-w64-gmp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(https://github.com/cddlib/cddlib/releases/download/$pkgver/cddlib-$pkgver.tar.gz)
sha256sums=('b87ee07ba2c1d0ab92a3e4eccacdf568f981a095a392e3b9efd7e7e4a9e125b1')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd cddlib-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/cddlib-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir"/ install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

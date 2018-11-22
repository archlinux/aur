pkgname=mingw-w64-agrum
pkgver=0.13.3
pkgrel=1
pkgdesc="C++ Bayesian networks library (mingw-w64)"
license=('GPL')
arch=('any')
url="http://agrum.gitlab.io/"
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('bfc6aa47b1cae82bf7dd58511441d2920cd8d48b890128b66ea131e7e2757653')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd aGrUM-$pkgver
  curl -L https://gitlab.com/agrumery/aGrUM/merge_requests/153.patch | patch -p1
}

build() {
  cd aGrUM-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CXXFLAGS="-fno-strict-aliasing -fno-tree-vrp" ${_arch}-cmake -DBUILD_PYTHON=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/aGrUM-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


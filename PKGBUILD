pkgname=mingw-w64-agrum
pkgver=0.12.0
pkgrel=1
pkgdesc="C++ Bayesian networks library (mingw-w64)"
license=('GPL')
arch=('any')
url="http://agrum.gitlab.io/"
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://gitlab.com/agrumery/aGrUM/repository/archive.tar.bz2?ref=${pkgver}")
sha256sums=('fd67a0b51ad5f96bbbfd3556c63cc2c1f6054104686cbcd327c51f21b4c3c6e2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # remove sha suffix
  mv aGrUM-${pkgver}-* agrum-$pkgver
}

build() {
  cd agrum-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_PYTHON=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/agrum-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


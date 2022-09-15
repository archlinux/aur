pkgname=mingw-w64-tasmanian
pkgver=7.7
pkgrel=1
pkgdesc="Toolkit for Adaptive Stochastic Modeling and Non-Intrusive ApproximatioN (mingw-w64)"
license=('BSD')
arch=('any')
url="https://tasmanian.ornl.gov/"
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/ORNL/TASMANIAN/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85fb3a7b302ea21a3b700712767a59a623d9ab93da03308fa47d4413654c3878')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd TASMANIAN-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
        -DTasmanian_ENABLE_OPENMP=ON \
        -DTasmanian_ENABLE_BLAS=ON \
        ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/TASMANIAN-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


pkgname=mingw-w64-ensmallen
pkgver=2.12.1
pkgrel=1
pkgdesc='Flexible C++ library for efficient mathematical optimization (mingw-w64)'
arch=('any')
url="https://ensmallen.org/"
license=('BSD')
depends=('mingw-w64-armadillo' 'mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://ensmallen.org/files/ensmallen-${pkgver}.tar.gz")
sha256sums=('e91a7053b2db055c41c981753ce3aeb1afaabd10370a8c541ec04e1f4d07d964')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "ensmallen-${pkgver}"
}

build() {
  cd "ensmallen-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_TESTS=OFF \
      -DUSE_OPENMP=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/ensmallen-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}

pkgname=mingw-w64-matplotplusplus
pkgver=1.1.0
pkgrel=1
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization (mingw-w64)"
url="https://alandefreitas.github.io/matplotplusplus/"
arch=(any)
license=('MIT')
depends=(mingw-w64-libtiff mingw-w64-libpng mingw-w64-libjpeg-turbo mingw-w64-fftw mingw-w64-lapack mingw-w64-zlib)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v$pkgver.tar.gz")
sha256sums=("5c3a1bdfee12f5c11fd194361040fe4760f57e334523ac125ec22b2cb03f27bb")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd matplotplusplus-${pkgver}
  curl -L https://github.com/alandefreitas/matplotplusplus/pull/159.patch | patch -p1
  curl -L https://github.com/alandefreitas/matplotplusplus/pull/204.patch | patch -p1
}

build() {
  cd matplotplusplus-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}  
    ${_arch}-cmake \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/matplotplusplus-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

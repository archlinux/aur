pkgname=mingw-w64-hmat-oss
pkgver=1.1.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library (mingw-w64)"
license=('GPL')
arch=('any')
url="https://github.com/jeromerobert/hmat-oss"
depends=('mingw-w64-cblas' 'mingw-w64-lapack')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
md5sums=('b4525676859f005f64e8d708356e404a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/hmat-oss-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF -DINSTALL_INCLUDE_DIR=/usr/${_arch}/include/hmat \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DINSTALL_INCLUDE_DIR=/usr/${_arch}/include/hmat \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/hmat-oss-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/hmat-oss-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

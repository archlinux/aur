pkgname=mingw-w64-zstd
pkgver=1.4.9
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm (mingw-w64)"
url="http://www.zstd.net/"
arch=('any')
license=('BSD' 'GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz")
sha256sums=('29ac74e19ea28659017361976240c4b5c5c24db3b89338731a6feb97c038d293')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd zstd-$pkgver
}

build() {
  cd zstd-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DZSTD_BUILD_PROGRAMS=OFF ../build/cmake/
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/zstd-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

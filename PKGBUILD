
pkgname=mingw-w64-zstd
pkgver=1.3.8
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm (mingw-w64)"
url="http://www.zstd.net/"
arch=('any')
license=('BSD' 'GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz")
sha256sums=('293fa004dfacfbe90b42660c474920ff27093e3fb6c99f7b76e6083b21d6d48e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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

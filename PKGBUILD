pkgname=mingw-w64-zstd
pkgver=1.4.5
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm (mingw-w64)"
url="http://www.zstd.net/"
arch=('any')
license=('BSD' 'GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz")
sha256sums=('98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd zstd-$pkgver
  curl -L https://github.com/facebook/zstd/pull/2143.patch | patch -p1
  curl -L https://github.com/facebook/zstd/pull/2162.patch | patch -p1
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

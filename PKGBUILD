pkgname=mingw-w64-zlib-ng
pkgver=2.1.4
pkgrel=1
pkgdesc="zlib replacement with optimizations for 'next generation' systems (mingw-w64)"
arch=('any')
url="https://github.com/zlib-ng/zlib-ng"
license=('custom:zlib')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a0293475e6a44a3f6c045229fe50f69dc0eebc62a42405a51f19d46a5541e77a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/zlib-ng-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_GTEST=OFF -DZLIB_ENABLE_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/zlib-ng-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}


pkgname=mingw-w64-utf8cpp
pkgver=3.1
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way (mingw-w64)"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
depends=()
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('ab531c3fd5d275150430bfaca01d7d15e017a188183be932322f2f651506b096')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "utfcpp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    # https://github.com/nemtrif/utfcpp/pull/40
    ${_arch}-cmake -DUTF8_TESTS=OFF -DCYGWIN=1 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/utfcpp-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}

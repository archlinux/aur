pkgname=mingw-w64-libwdm
pkgver=0.2.6
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8f24a35f3487fcba4d612320973c747299cbb93c25dd937cff03844a5fdadce667ba5e6475775c652895ecbdfffd243f22ce7ae1256971430012a574ddc311f6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd wdm-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DBUILD_TESTING=OFF -DOPT_ASAN=OFF .
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/wdm-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}

pkgname=mingw-w64-libwdm
pkgver=0.2.2
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('68f88af46e2a66edfffcfdbcaccc8ca1e91014d94d4bf19f9224d8c1046a0233fe371488cbb78e636e5b1b12980553a885933eaf8253a044e4aa2842be23f80c')
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
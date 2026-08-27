pkgname=mingw-w64-libwdm
pkgver=0.3.0
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cf3c36ab125cdaa3fe6a8995eca7202ce3201318adb4c3460db85f86fa8287b13e7b173bafc7863ec2319a4f6a49070c71c705314fb564dbc69adcef67d81149')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd wdm-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DBUILD_TESTING=OFF -DOPT_ASAN=OFF .
    cmake --build build-${_arch}
  done
}

package() {
  cd wdm-${pkgver}
  for _arch in $_architectures; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}

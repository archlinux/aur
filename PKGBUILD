pkgname=mingw-w64-libwdm
pkgver=0.3.2
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c93fd94c77d56d9c8060638086dd0d563c83740b5412f312fdd180853dec6e941314d3009d62df001d5b971b75f8d8b6bd573f4604d36f520511615068f1dbe')

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

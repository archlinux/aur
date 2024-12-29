pkgname=mingw-w64-libwdm
pkgver=0.2.5
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures (mingw-w64)"
arch=(any)
url="https://github.com/tnagler/wdm"
license=(MIT)
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a8b81c36f136759005b764aca650d862b77999fcd3a7e00390f1b4f8ee12a08f5f7aacc6984a1a2cccc73ec376060aae1fc8bdca8762abd5a41161d3a550e98a')
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

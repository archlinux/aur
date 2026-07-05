pkgname=('mingw-w64-flint')
pkgver=3.6.0
pkgrel=1
pkgdesc='A C library for doing number theory (mingw-w64)'
url='http://www.flintlib.org'
arch=('any')
license=(LGPL-3.0-only)
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-cblas')
source=("https://github.com/flintlib/flint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4307a504622702bf0be6d8969791f7d7ff378645cf2ae3bb5a7a2b56653d97f1')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd flint-${pkgver}
}

build() {
  cd flint-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DIPO_SUPPORTED=OFF -DENABLE_ARCH=NO -DENABLE_AVX2=OFF -DHAS_FLAG_AVX2=0 -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd flint-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --build build-${_arch} --target install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}

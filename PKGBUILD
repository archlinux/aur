pkgname=('mingw-w64-flint')
pkgver=3.1.3
pkgrel=1
pkgdesc='A C library for doing number theory (mingw-w64)'
url='http://www.flintlib.org'
arch=('any')
license=(LGPL-3.0-only)
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-mpfr' 'mingw-w64-cblas')
source=("https://github.com/flintlib/flint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c3ca5a4c1763a4b3718403983937f432c31629b6f415b1df4f1074da429b613')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd flint-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DIPO_SUPPORTED=OFF -DHAS_FLAG_GCC_MARCH_NATIVE=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/flint-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}

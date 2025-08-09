pkgname=('mingw-w64-cpptrace')
pkgver=1.0.4
pkgrel=1
pkgdesc='Simple, portable, and self-contained stacktrace library for C++11 and newer (mingw-w64)'
url='https://github.com/jeremy-rifkin/cpptrace'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-libbacktrace-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5c9f5b301e903714a4d01f1057b9543fa540f7bfcc5e3f8bd1748e652e24f9ea')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd cpptrace-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DCPPTRACE_GET_SYMBOLS_WITH_LIBDWARF=OFF -DCPPTRACE_GET_SYMBOLS_WITH_LIBBACKTRACE=ON -DCMAKE_UNITY_BUILD=ON .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cpptrace-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}

pkgname=('mingw-w64-cpptrace')
pkgver=1.0.2
pkgrel=1
pkgdesc='Simple, portable, and self-contained stacktrace library for C++11 and newer (mingw-w64)'
url='https://github.com/jeremy-rifkin/cpptrace'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-libbacktrace-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f92825b3c839c3af851204c79ea2a63871f9060f016e7c0411cfdc1727978feb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd cpptrace-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DCPPTRACE_GET_SYMBOLS_WITH_LIBDWARF=OFF -DCPPTRACE_GET_SYMBOLS_WITH_LIBBACKTRACE=ON .
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

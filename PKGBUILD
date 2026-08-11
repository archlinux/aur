pkgname=mingw-w64-libaec
pkgver=1.1.7
pkgrel=1
pkgdesc="Adaptive Entropy Coding library (mingw-w64)"
arch=('any')
url='https://gitlab.dkrz.de/dkrz-sw/libaec'
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
_md5=ea0b7d197a950b0c110da8dfdecbb71f
source=("${url}/-/archive/v${pkgver}/libaec-v${pkgver}.tar.bz2")
sha256sums=('7cf0034eca8f53449252f2fab863d855aedc0520ceb8d3f3fcd3bd601ce4c85e')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/libaec-v${pkgver}"
}

build() {
  cd "${srcdir}/libaec-v${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -B build-${_arch}-static .
    make -C build-${_arch}-static
    ${_arch}-cmake -DBUILD_TESTING=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "${srcdir}/libaec-v${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

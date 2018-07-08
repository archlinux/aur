# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=bcunit
pkgname=mingw-w64-${_pkgname}
pkgver=3.0.2
pkgrel=1
pkgdesc="Lightweight system for writing, administering, and running unit tests in C (mingw-w64)"
arch=('any')
url="https://github.com/BelledonneCommunications/bcunit"
license=('LGPL2')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/${pkgver}.tar.gz")
sha256sums=('eb7090aca5006aa0cea425722cb3fa1a7139185a7d9d1734d57844f69084713f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  [ -x configure ] || ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/${_arch}/doc" "${pkgdir}/usr/${_arch}/share/doc"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

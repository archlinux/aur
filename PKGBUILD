# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-babl
pkgver=0.1.64
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (mingw-w64)"
arch=('any')
url="http://gegl.org/babl/"
license=('LGPL3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://ftp.gtk.org/pub/babl/${pkgver%.*}/babl-${pkgver}.tar.bz2")
sha256sums=('bb774d30b403511b95aa42f833a3562580c3b7cf3187f0923748d17775d158bf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/babl-${pkgver}
  autoreconf -fiv
}

build() { 
  cd ${srcdir}/babl-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/babl-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}${MINGW_PREFIX}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/babl-*/*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/babl-*/*.a
  done
}

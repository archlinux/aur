# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-jansson
pkgver=2.12
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data (mingw-w64)"
arch=(any)
url="http://www.digip.org/jansson/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.gz")
sha512sums=('e40bdafdfa1fa663f71e00c06d7bfc98cff4ed3581a147894e5272e50fa5f9b9a7af6aaca41ff423a2ddd2554a192b36efcc32f6a3c98c727e9f819b955357cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/jansson-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jansson-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

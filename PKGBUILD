# Maintainer: Dr-Shadow <kerdiles.robin@gmail.com>

_realname=libmpcdec
pkgname=mingw-w64-${_realname}
pkgver=1.2.6
pkgrel=1
pkgdesc="Musepack decoding library (mingw-w64)"
arch=('any')
license=('BSD')
url="http://www.musepack.net/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure'
	     'mingw-w64-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("http://files.musepack.net/source/libmpcdec-1.2.6.tar.bz2"
	'libmpcdec-fix-cross-compile.patch')
sha1sums=('32139ff5cb43a18f7c99637da76703c63a55485a'
	  'f96d29a91255e18d2cfc35afd353bdccd4b35061')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${_realname}-${pkgver}
  patch -Np1 -i ${srcdir}/libmpcdec-fix-cross-compile.patch
  autoreconf -fvi
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_realname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
  install -Dm644 "${srcdir}/${_realname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/mingw-w64-${_realname}/LICENSE"
}

# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-gloox
pkgver=1.0.21
pkgrel=1
pkgdesc="C++ libraries for development of Jabber client/component/server (mingw-w64)"
arch=('any')
url="http://camaya.net/gloox"
license=("GPL")
depends=('mingw-w64-libidn' 'mingw-w64-gnutls')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://camaya.net/download/gloox-${pkgver}.tar.bz2"
        "gloox-1.0.21-fix-undefined-reference.patch")
sha256sums=('3c13155c10e3182a1a57779134cc524efb3657545849534b2831fae0e2c3a7cc'
            '4b293353b21b757df5e41237108075a9e2906af2189ff625460e05f132ff4510')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gloox-${pkgver}/"
  patch -Np1 -i "${srcdir}/gloox-1.0.21-fix-undefined-reference.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/gloox-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-tests \
      --without-examples \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gloox-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

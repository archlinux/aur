# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-gloox
pkgver=1.0.23
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
sha256sums=('97cb6a0c07e320ffa4a7c66e8ab06b2361086271dc87ed2398befef4e8435f8a'
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
    LIBS+=" -lssp" ${_arch}-configure \
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

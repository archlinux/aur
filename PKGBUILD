# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-gloox
pkgver=1.0.22
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
sha256sums=('4ade1b14848ccfcd89a505a4fff05116c24f13cef8d02fab0ade2717117ec964'
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

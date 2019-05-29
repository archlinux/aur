# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Filip Brcic < brcha at gna dot org >

_pkgver=1.1.1c
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-openssl
pkgver=${_pkgver/[a-z]/.${_pkgver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw-w64)"
arch=('any')
url="https://www.openssl.org"
license=('BSD')
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-gcc'
             'perl')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://www.openssl.org/source/openssl-${_pkgver}.tar.gz"{,.asc})
sha256sums=('f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90'
            'SKIP')
validpgpkeys=('7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C') # Richard Levitte <levitte@openssl.org>

prepare() {
  cd openssl-${_pkgver}
}

build() {
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"

  cd "${srcdir}/openssl-${_pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}" && cp -a "${srcdir}/openssl-${_pkgver}/"* "${srcdir}/build-${_arch}" && cd "${srcdir}/build-${_arch}"
    _mingw=mingw
    [ "${_arch}" = 'x86_64-w64-mingw32' ] && _mingw=mingw64
    ./Configure \
      --prefix=/usr/${_arch} \
      --cross-compile-prefix=${_arch}- \
      -DOPENSSL_NO_CAPIENG \
      ${_mingw} \
      threads \
      shared \
      no-ssl3-method \
      zlib-dynamic \
      "${CFLAGS}"
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make -j1 DESTDIR="${pkgdir}" install_sw
    install -m644 ms/applink.c "${pkgdir}/usr/${_arch}/include/openssl/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:

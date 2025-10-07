# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Filip Brcic < brcha at gna dot org >
# Contributor: Martchus < martchus at gmx dot net >

_pkgver=3.6.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-openssl
pkgver=${_pkgver/[a-z]/.${_pkgver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw-w64)"
arch=('any')
url='https://www.openssl.org'
license=('Apache-2.0')
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-gcc'
             'mingw-w64-environment'
             'perl')
options=('!strip' 'staticlibs' '!buildflags' '!lto')
source=("https://github.com/openssl/openssl/releases/download/openssl-${pkgver}/openssl-${pkgver}.tar.gz"{,.asc})
sha256sums=('b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9'
            'SKIP')
validpgpkeys=('EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
              'BA5473A2B0587B07FB27CF2D216094DFD0CB81EF')

prepare() {
  cd openssl-${_pkgver}
}

build() {
  cd "${srcdir}/openssl-${_pkgver}"
  for _arch in ${_architectures}; do
    source mingw-env ${_arch}
    if [[ $_arch != 'aarch64-w64-mingw32' ]]; then
      _cross_prefix=--cross-compile-prefix=${_arch}-
      unset CC CXX # those variables conflict with --cross-compile-prefix
    fi
    mkdir -p "${srcdir}/build-${_arch}" && cp -a "${srcdir}/openssl-${_pkgver}/"* "${srcdir}/build-${_arch}" && cd "${srcdir}/build-${_arch}"
    if [[ $_arch = 'aarch64-w64-mingw32' ]]; then
      _mingw=mingwarm64
    elif [[ $_arch = 'x86_64-w64-mingw32' ]]; then
      _mingw=mingw64
    else
      _mingw=mingw
    fi
    ./Configure \
      --prefix=/usr/${_arch} \
      ${_cross_prefix} \
      -DOPENSSL_NO_CAPIENG \
      ${_mingw} \
      threads \
      shared \
      no-ssl3-method \
      zlib-dynamic \
      "${CFLAGS}"
    make LIBDIR=lib
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make -j1 DESTDIR="${pkgdir}" LIBDIR=lib install_sw
    install -m644 ms/applink.c "${pkgdir}/usr/${_arch}/include/openssl/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}

# vim:set ts=2 sw=2 et:

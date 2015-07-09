# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-openssl
_ver=1.0.2d
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw-w64)"
arch=(any)
depends=(mingw-w64-zlib)
makedepends=(mingw-w64-gcc perl)
options=(!strip !buildflags !makeflags staticlibs)
license=("custom:BSD")
url="http://www.openssl.org"
source=("http://www.openssl.org/source/openssl-$_ver.tar.gz"{,.asc}
"openssl-0.9.6-x509.patch"
"openssl-1.0.0a-ldflags.patch"
"openssl-1.0.0d-windres.patch"
"openssl-1.0.1-x32.patch"
"openssl-1.0.2a-parallel-build.patch")
md5sums=('38dd619b2e77cbac69b99f52a053d25a'
         'SKIP'
         '990d027cc82ff8b2acffead24073d43c'
         'dd616e53eba607f5ab46634f93d5c5a5'
         'df46ea89a28b0bd18f13b9ab63d1ade3'
         '7400927e547cd4c68d2af2fe0b322345'
         '7ea5aaac21cee0f89dfb58b03219caaa')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd openssl-$_ver
  patch -p1 -i ${srcdir}/openssl-1.0.0a-ldflags.patch
  patch -p1 -i ${srcdir}/openssl-1.0.0d-windres.patch
  patch -p1 -i ${srcdir}/openssl-1.0.2a-parallel-build.patch
  patch -p1 -i ${srcdir}/openssl-1.0.1-x32.patch
  patch -p1 -i ${srcdir}/openssl-0.9.6-x509.patch
  sed -i -e '/^"mingw"/ s/-fomit-frame-pointer -O3 -march=i486 -Wall/-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4/' Configure
  sed -i -e '/^"mingw64"/ s/-O3 -Wall/-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4/' Configure
}

build() {
  cd "${srcdir}/openssl-$_ver"
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}" && cp -a "${srcdir}/openssl-$_ver/"* "${srcdir}/build-${_arch}" && cd "${srcdir}/build-${_arch}"
    _mingw=mingw
    [ "${_arch}" = 'x86_64-w64-mingw32' ] && _mingw=mingw64
    ./Configure \
      --prefix=/usr/${_arch} \
      --cross-compile-prefix=${_arch}- \
      -DOPENSSL_NO_CAPIENG \
      ${_mingw} \
      threads \
      shared \
      zlib-dynamic
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make -j1 INSTALL_PREFIX="${pkgdir}" install
    install -m644 ms/applink.c "${pkgdir}/usr/${_arch}/include/openssl/"
    rm -rf "$pkgdir/usr/${_arch}/"{bin/c_rehash,ssl,share}
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

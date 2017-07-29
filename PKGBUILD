# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-openssl
_ver=1.1.0f
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=2
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw-w64)"
arch=(any)
depends=(mingw-w64-zlib)
makedepends=(mingw-w64-gcc perl)
options=(!strip !buildflags staticlibs !emptydirs)
license=("custom:BSD")
url="http://www.openssl.org"
source=("http://www.openssl.org/source/openssl-$_ver.tar.gz"{,.asc}
"fs54205.patch"
"openssl-1.0.2a-x509.patch")
md5sums=('7b521dea79ab159e8ec879d2333369fa'
         'SKIP'
         '2f1b34d666894f447241c60191e9cfda'
         'c730f823023879de28513081aedbf06b')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd openssl-$_ver
  patch -p1 -i ${srcdir}/openssl-1.0.2a-x509.patch
  patch -Np1 -i "$srcdir/fs54205.patch"
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
      no-ssl3-method \
      zlib-dynamic
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make -j1 DESTDIR="${pkgdir}" install_sw
    install -m644 ms/applink.c "${pkgdir}/usr/${_arch}/include/openssl/"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

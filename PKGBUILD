# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=mingw-w64-openssl-1.0
_ver=1.0.2q
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('any')
depends=('mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'perl')
options=(!strip !buildflags staticlibs !emptydirs)
license=('custom:BSD')
url='https://www.openssl.org'
source=("http://www.openssl.org/source/openssl-$_ver.tar.gz"{,.asc}
        'openssl-1.0.2a-x509.patch'
        'openssl-1.0.0a-ldflags.patch'
        'openssl-1.0.1-x32.patch'
        'openssl-1.0.2a-parallel-build.patch'
        'openssl-1.0-versioned-symbols.patch')
sha256sums=('5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684'
            'SKIP'
            'd38dfc58fe2c3723f2dfa10408394a6e796bd1e7273804cb19c41baf3dcee534'
            '164aa4928b022cc716fac545b4fd69899cb274682aa487100e595abb652adbae'
            'f913185a36538315de3ff122ef96fc9a49e068078e65895cfc950bdb4ac4e4f0'
            '609d7ca040f7ab26f5e9844e486b3bcc04f3da656ce2db7733fbd65c6d10457a'
            '353a84e4c92e36c379ebd9216b8f8fb9c271396583561eb84ac8c825979acaa6')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd openssl-$_ver
  patch -p1 -i ${srcdir}/openssl-1.0.0a-ldflags.patch
  patch -p1 -i ${srcdir}/openssl-1.0.2a-parallel-build.patch
  patch -p1 -i ${srcdir}/openssl-1.0.1-x32.patch
  patch -p1 -i ${srcdir}/openssl-1.0.2a-x509.patch
  sed -i -e '/^"mingw"/ s/-fomit-frame-pointer -O3 -march=i486 -Wall/-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4/' Configure
  sed -i -e '/^"mingw64"/ s/-O3 -Wall/-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4/' Configure
  # add symbol versioning to prevent conflicts with openssl 1.1 symbols (Debian)
  patch -p1 -i "$srcdir"/openssl-1.0-versioned-symbols.patch
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
      --libdir=lib/openssl-1.0 \
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
    make -j1 INSTALL_PREFIX="${pkgdir}" install_sw

    # Move some files around
    install -m755 -d "$pkgdir/usr/${_arch}/include/openssl-1.0"
    #install -m755 -d "$pkgdir/usr/${_arch}/bin/openssl-1.0"
    mv "$pkgdir/usr/${_arch}/include/openssl" "$pkgdir/usr/${_arch}/include/openssl-1.0/"
    #mv "$pkgdir/usr/${_arch}/bin/"*.dll "$pkgdir/usr/${_arch}/bin/openssl-1.0"
    mv "$pkgdir/usr/${_arch}/bin/openssl.exe" "$pkgdir/usr/${_arch}/bin/openssl-1.0.exe"
    rm -r "$pkgdir/usr/${_arch}/ssl/" "$pkgdir/usr/${_arch}/bin/c_rehash"
    install -m644 ms/applink.c "${pkgdir}/usr/${_arch}/include/openssl-1.0/"

    # Update includedir in .pc files
    sed -e 's|/include$|/include/openssl-1.0|' -i "$pkgdir"/usr/${_arch}/lib/openssl-1.0/pkgconfig/*.pc

    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

pkgname=mingw-w64-gnutls
pkgver=3.3.12
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/gnutls"
license=("GPL3, LGPL2.1")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libtasn1 mingw-w64-readline mingw-w64-zlib mingw-w64-nettle mingw-w64-p11-kit)
options=(staticlibs !strip !buildflags)
optdepends=("mingw-w64-openssl: libgnutls-openssl")
source=("ftp://ftp.gnutls.org/gcrypt/gnutls/v${pkgver%.*}/gnutls-${pkgver}.tar.xz"{,.sig}
        'gnutls-3.2.7-rpath.patch'
        'gnutls-3.1.11-nosrp.patch'
        'gnutls-3.3.6-default-policy.patch'
        'gnutls-fix-external-libtasn1-detection.patch')
md5sums=('a37b20b4352a5f542367ded904729c90'
         'SKIP'
         '291612225516234ede7e60f8b367dd8b'
         'c3a2abfe08f47d9b07f770689b0c1b39'
         'e0dba6bfe81b965a352f965b1398bcad'
         'f90a0f01eb0f2a6b7afcc25a836eb67e')
validpgpkeys=('1F42418905D8206AA754CCDC29EE58B996865171')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gnutls-${pkgver}"
  patch -p0 -i ../gnutls-fix-external-libtasn1-detection.patch
  patch -p1 -i ../gnutls-3.2.7-rpath.patch
  patch -p1 -i ../gnutls-3.1.11-nosrp.patch
  patch -p1 -i ../gnutls-3.3.6-default-policy.patch
  sed 's/gnutls_srp.c//g' -i lib/Makefile.in
  sed 's/gnutls_srp.lo//g' -i lib/Makefile.in
  rm -f lib/minitasn1/*.c lib/minitasn1/*.h
}

build() {
  cd "${srcdir}/gnutls-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-doc \
      --disable-openssl-compatibility \
      --disable-srp-authentication \
      --disable-nls \
      --disable-rpath \
      --disable-non-suiteb-curves \
      --with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit" \
      --enable-local-libopts \
      --without-tpm
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gnutls-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/bin/*.def
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

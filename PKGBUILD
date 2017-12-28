# Maintainer: Martchus <martchus@gmx.net>

pkgname=mingw-w64-gnutls
pkgver=3.5.16
pkgrel=1
pkgdesc='A library which provides a secure layer over a reliable transport layer (mingw-w64)'
arch=('any')
url="http://www.gnu.org/software/gnutls"
license=('GPL3', 'LGPL2.1')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libtasn1' 'mingw-w64-readline' 'mingw-w64-zlib' 'mingw-w64-nettle' 'mingw-w64-p11-kit' 'mingw-w64-libunistring')
options=(staticlibs !strip !buildflags)
optdepends=("mingw-w64-openssl: libgnutls-openssl")
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/${pkgname#mingw-w64-}-${pkgver}.tar.xz{,.sig}
        'gnutls-3.2.7-rpath.patch'
        'gnutls-fix-external-libtasn1-detection.patch')
sha256sums=('0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25'
            'SKIP'
            'c77b307dcbe3d83b99a15b9ff0cac3978983b40b8cb2495eeb02ade5c9c12969'
            '8525da75852a516be0cb05df0a770daf19ce0583033260d6cac03a1e40fd2072')
validpgpkeys=('0424D4EE81A0E3D119C6F835EDA21E94B565716F'
              '1F42418905D8206AA754CCDC29EE58B996865171')
               # "Simon Josefsson <simon@josefsson.org>"
               # "Nikos Mavrogiannopoulos <nmav@gnutls.org>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/gnutls-${pkgver}"
  patch -p0 -i ../gnutls-fix-external-libtasn1-detection.patch
  patch -p1 -i ../gnutls-3.2.7-rpath.patch
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

    # remove libraries which conflict with libraries provided by mingw-w64-crt
    # (those libs are likely only mocks for the testsuite)
    rm "$pkgdir"/usr/${_arch}/lib/crypt32{.a,.dll.a,.dll}
    rm "$pkgdir"/usr/${_arch}/lib/ncrypt{.a,.dll.a,.dll}

    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

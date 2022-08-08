# Maintainer: Martchus <martchus@gmx.net>

pkgname=mingw-w64-gnutls
pkgver=3.7.7
pkgrel=1
pkgdesc='A library which provides a secure layer over a reliable transport layer (mingw-w64)'
arch=('any')
url="http://www.gnu.org/software/gnutls"
license=('GPL3' 'LGPL2.1')
makedepends=('mingw-w64-configure' 'autogen')
checkdepends=('mingw-w64-wine')
depends=('mingw-w64-crt' 'mingw-w64-libtasn1' 'mingw-w64-readline' 'mingw-w64-zlib' 'mingw-w64-nettle' 'mingw-w64-p11-kit' 'mingw-w64-libunistring')
options=(staticlibs !strip !buildflags)
optdepends=("mingw-w64-openssl: libgnutls-openssl")
source=(https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/${pkgname#mingw-w64-}-${pkgver}.tar.xz{,.sig}
        gnutls-fix-external-libtasn1-detection.patch)
sha256sums=('be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106'
            'SKIP'
            '8525da75852a516be0cb05df0a770daf19ce0583033260d6cac03a1e40fd2072')
#validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # "Daiki Ueno <ueno@unixuser.org>"
validpgpkeys=('5D46CB0F763405A7053556F47A75A648B3F9220C') # "Zoltan Fridrich <zfridric@redhat.com>"

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/gnutls-${pkgver}"
  patch -p0 -i ../gnutls-fix-external-libtasn1-detection.patch
  sed 's/gnutls_srp.c//g' -i lib/Makefile.in
  sed 's/gnutls_srp.lo//g' -i lib/Makefile.in
  rm -f lib/minitasn1/*.c lib/minitasn1/*.h
}

build() {
  cd "${srcdir}/gnutls-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    #export WINEPATH=/usr/${_arch}/bin
    ${_arch}-configure \
      --disable-doc \
      --disable-openssl-compatibility \
      --disable-srp-authentication \
      --disable-rpath \
      --disable-non-suiteb-curves \
      --disable-gtk-doc \
      --disable-guile \
      --disable-full-test-suite \
      --with-libiconv-prefix=/usr/$_arch \
      --with-regex-libs=-lsystre \
      --enable-nls \
      --enable-cxx \
      --enable-local-libopts \
      --without-tpm
    make
    popd
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gnutls-${pkgver}/build-${_arch}"
    export WINEPATH=/usr/${_arch}/bin
    msg2 'Skipping check due to undefined reference errors'
    # disable parallel tests:
    # FAIL: serv-udp.sh
    #WINEDEBUG=all make -C tests -j1 check
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gnutls-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install

    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

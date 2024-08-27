# Maintainer: Martchus <martchus@gmx.net>

pkgname=mingw-w64-gnutls
_pkgname=${pkgname#mingw-w64-}
pkgver=3.8.7
pkgrel=1
pkgdesc='A library which provides a secure layer over a reliable transport layer (mingw-w64)'
arch=('any')
url="https://www.gnutls.org/"
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
makedepends=('mingw-w64-configure' 'autogen')
checkdepends=('mingw-w64-wine')
depends=('mingw-w64-crt' 'mingw-w64-libtasn1' 'mingw-w64-readline' 'mingw-w64-zlib' 'mingw-w64-nettle' 'mingw-w64-p11-kit' 'mingw-w64-libunistring')
options=(staticlibs !strip !buildflags)
optdepends=("mingw-w64-openssl: libgnutls-openssl")
source=(#https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz{,.sig}
       https://www.gnupg.org/ftp/gcrypt/gnutls/v${pkgver%.*}/${_pkgname}-${pkgver}.1.tar.xz{,.sig}
       gnutls-fix-external-libtasn1-detection.patch)
sha256sums=('9ca0ddaccce28a74fa18d738744190afb3b0daebef74e6ad686bf7bef99abd60'
            'SKIP'
            '8525da75852a516be0cb05df0a770daf19ce0583033260d6cac03a1e40fd2072')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # "Daiki Ueno <ueno@unixuser.org>"
#validpgpkeys=('5D46CB0F763405A7053556F47A75A648B3F9220C') # "Zoltan Fridrich <zfridric@redhat.com>"

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/gnutls-${pkgver}"
  patch -p0 -i ../gnutls-fix-external-libtasn1-detection.patch
  sed 's/gnutls_srp.c//g' -i lib/Makefile.in
  sed 's/gnutls_srp.lo//g' -i lib/Makefile.in
  rm -f lib/minitasn1/*.c lib/minitasn1/*.h
  sed -i 's/gettime(/benchmark_gettime(/' 'src/benchmark.'{h,c}
}

build() {
  cd "${srcdir}/gnutls-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export CFLAGS=-fpermissive CXXFLAGS=-fpermissive
    ${_arch}-configure \
      --disable-doc \
      --disable-gtk-doc \
      --disable-srp-authentication \
      --disable-rpath \
      --disable-non-suiteb-curves \
      --disable-gtk-doc \
      --disable-full-test-suite \
      --with-libiconv-prefix=/usr/$_arch \
      --enable-openssl-compatibility \
      --enable-nls \
      --enable-cxx \
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

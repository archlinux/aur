pkgname=mingw-w64-libgcrypt
pkgver=1.7.0
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG (mingw-w64)"
arch=("any")
url="http://www.gnupg.org"
license=("LGPL")
depends=(mingw-w64-libgpg-error)
makedepends=(mingw-w64-configure transfig ghostscript)
options=(staticlibs !buildflags !strip)
source=("ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"
"libgcrypt-use-correct-def-file.patch")
md5sums=('67ec79bdde8fd815c9cdd55aa9555935'
         '531e089caca74b5daf130b7173c2a5c5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libgcrypt-${pkgver}"
  patch -p0 -i "$srcdir"/libgcrypt-use-correct-def-file.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}/libgcrypt-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    configure_args=""
    if test "${_arch}" = "x86_64-w64-mingw32"
    then
      configure_args="ac_cv_sys_symbol_underscore=no --disable-padlock-support"
    fi
    ${_arch}-configure \
      --enable-pubkey-ciphers='dsa elgamal rsa ecc' \
      --with-gpg-error-prefix=/usr/${_arch} \
      --disable-padlock-support $configure_args
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libgcrypt-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install -j1 
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/lib/*.def
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


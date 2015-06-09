pkgname=mingw-w64-libgcrypt
pkgver=1.6.3
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG (mingw-w64)"
arch=("any")
url="http://www.gnupg.org"
license=("LGPL")
depends=(mingw-w64-libgpg-error)
makedepends=(mingw-w64-configure transfig ghostscript)
options=(staticlibs !buildflags !strip)
source=("ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"
"libgcrypt-mingw64-use-correct-datatype-for-GetProcessWorkingSet.patch"
"libgcrypt-use-correct-def-file.patch"
"libgcrypt-use-correct-asm-code-for-win64.patch")
md5sums=('4262c3aadf837500756c2051a5c4ae5e'
         '7bb247584a66a83677c618aec812ca9b'
         '531e089caca74b5daf130b7173c2a5c5'
         'ccdd21fdd8b28690ed7e736a77606735')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libgcrypt-${pkgver}"
  patch -p0 -i "$srcdir"/libgcrypt-mingw64-use-correct-datatype-for-GetProcessWorkingSet.patch
  patch -p0 -i "$srcdir"/libgcrypt-use-correct-def-file.patch
  patch -p1 -i "$srcdir"/libgcrypt-use-correct-asm-code-for-win64.patch
  autoreconf -vfi
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
      --with-gpg-error-prefix=/usr/${_arch} $configure_args
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


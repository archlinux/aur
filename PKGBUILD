pkgname=mingw-w64-gettext
pkgver=0.21
pkgrel=1
arch=('any')
pkgdesc='GNU internationalization library (mingw-w64)'
depends=('mingw-w64-termcap' 'mingw-w64-libunistring')
makedepends=('gettext' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
license=("GPL")
url="http://www.gnu.org/software/gettext/"
source=(http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz{,.sig}
        gettext-printf_collision.patch
        gettext_formatstring-ruby.patch
        intl.pc)
sha256sums=('c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12'
            'SKIP'
            '7da6794550b0704a58ed9984913ebf671d98ab3178dbc58dd88337c35c8cdadb'
            '380910da75c5aa62524acb18fc54415b2c0ad391f6385ea4369bbd1e6e0d29ef'
            '0dc8a3e2c95d79aacaeaacd3c90e41c0f5d6ba9cfbc949a0ca55f4b0fd389d9c')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd gettext-$pkgver
  patch -p1 -i "${srcdir}"/gettext-printf_collision.patch
  patch -p1 -i "${srcdir}"/gettext_formatstring-ruby.patch
}

build() {
  cd gettext-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export MINGW_LDFLAGS="-Wl,--enable-auto-import"
    LIBS="-lssp" ${_arch}-configure \
      --disable-java \
      --disable-native-java \
      --disable-csharp \
      --enable-threads=win32 \
      --without-emacs ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir/usr/${_arch}/bin/"{autopoint,gettext.sh,gettextize}
    rm -r "$pkgdir/usr/${_arch}/lib/gettext"
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    # provide pkgconfig file for iconv library
    install -dm755 "$pkgdir/usr/${_arch}/lib/pkgconfig"
    install -m644 "$srcdir/intl.pc" "$pkgdir/usr/${_arch}/lib/pkgconfig"
    sed -i "$pkgdir/usr/${_arch}/lib/pkgconfig/intl.pc" \
      -e "s|@PREFIX[@]|/usr/${_arch}|g" \
      -e "s|@VERSION[@]|$pkgver|g"
  done
}

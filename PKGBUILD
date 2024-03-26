pkgname=mingw-w64-gettext
pkgver=0.22.5
pkgrel=1
arch=('any')
pkgdesc='GNU internationalization library (mingw-w64)'
depends=('mingw-w64-termcap' 'mingw-w64-libunistring')
makedepends=('gettext' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
license=('GPL-2.0-only' 'LGPL-2.0-only' 'GFDL-1.2-only' 'GPL-2.0-or-later')
url="http://www.gnu.org/software/gettext/"
source=(http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz{,.sig}
        intl.pc)
sha256sums=('ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0'
            'SKIP'
            '0dc8a3e2c95d79aacaeaacd3c90e41c0f5d6ba9cfbc949a0ca55f4b0fd389d9c')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D') # Bruno Haible (Open Source Development)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd gettext-$pkgver
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

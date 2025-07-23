pkgname=mingw-w64-gettext
pkgver=0.26
pkgrel=1
arch=('any')
pkgdesc='GNU internationalization library (mingw-w64)'
depends=('mingw-w64-termcap' 'mingw-w64-libunistring')
makedepends=('gettext' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
license=('GPL-2.0-only' 'LGPL-2.0-only' 'GFDL-1.2-only' 'GPL-2.0-or-later')
url="http://www.gnu.org/software/gettext/"
source=(http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz{,.sig}
        intl.pc
        0001-restore-DllMain-symbol.patch
        0024-disable-gnu-format.patch)
b2sums=('f8e6b6d232b0a92f333d934c273a6923af40a9d6c632e20d240c7260d13f4be4bacd89efe4ccc2cce5a847e45e87911d692ef6c6f749c1821d1d5508daa14188'
        'SKIP'
        '9ceacac403a64800f46e2a5ba2e238454a781ac2fbc9508330f5269aee5a0e77066ac4c5e16d852fe101116a152fa79879b956930d0fffb0e4c992ca2f16a0e9'
        'ad82e06ba60e337c6b307824b0e64919fef736449192876a75eb483614debd413b31c9899c076614ca96ba611d5bb8209cd6044c26ad8ffa7945190d74ef6d7a'
        'c3e5d735aa791b684f5111327d9d07fb54aa1f4ed0cacfdb98b47ff3e47edb037b786a2cb84b7db5a63aa25f371708843d48eea2e3d9b2f0ed6c02fd5ba0e16f')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D'  # Bruno Haible
              'E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Open Source Development)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd gettext-$pkgver
  patch -p1 -i ../0001-restore-DllMain-symbol.patch
  patch -p1 -i ../0024-disable-gnu-format.patch
}

build() {
  cd gettext-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export CFLAGS=-fpermissive CXXFLAGS=-fpermissive
    export MINGW_LDFLAGS="-Wl,--enable-auto-import"
    LIBS="-lssp" ${_arch}-configure \
      --disable-java \
      --disable-native-java \
      --disable-csharp \
      --enable-threads=win32 \
      --without-emacs ..
    [[ $pkgname =~ .*-clang-.* ]] && \
      find . -name libtool -exec sed -i -e 's|-nostdlib||g' {} \+
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

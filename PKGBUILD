# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-gettext
pkgver=0.19.8.1
pkgrel=3
arch=('any')
pkgdesc='GNU internationalization library (mingw-w64)'
depends=('mingw-w64-termcap' 'mingw-w64-libunistring')
makedepends=('gettext' 'mingw-w64-configure')
options=(!strip !buildflags staticlibs)
license=("GPL")
url="http://www.gnu.org/software/gettext/"
source=("http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz"{,.sig}
        "05-always-use-libintl-vsnprintf.mingw.patch"
        "06-dont-include-ctype-after-gnulibs-wctype.mingw.patch"
        "07-fix-asprintf-conflict.mingw.patch"
        "08-vs-compatible.patch"
        "09-gnulib-fix-underscore-cond.patch"
        "intl.pc")
md5sums=('97e034cf8ce5ba73a28ff6c3c0638092'
         'SKIP'
         '27852a388b8cf38188dc392c244230ff'
         'f69747f43f279b8a81286cfe5916b82f'
         '3ebccf730ec3377b068027eb2283afb2'
         'f5b611172ae58f1e4589a8d0c1d53414'
         'bed0da63d251975a21ca830f2f156766'
         'b0a123ec7ad1a345d0d712dae986a543')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd gettext-$pkgver
  patch -p0 -i ${srcdir}/05-always-use-libintl-vsnprintf.mingw.patch
  patch -p0 -i ${srcdir}/06-dont-include-ctype-after-gnulibs-wctype.mingw.patch
  patch -p0 -i ${srcdir}/07-fix-asprintf-conflict.mingw.patch
  patch -p0 -i ${srcdir}/08-vs-compatible.patch
  # prevents "Cannot export rpl_printf: symbol not found"
  patch -p0 -i ${srcdir}/09-gnulib-fix-underscore-cond.patch
  autoreconf -i
}

build() {
  cd gettext-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    # define USER_LABEL_PREFIX_UNDERSCORE to prevent undefined reference to `__imp_exit_failure'
    # and similar errors
    local underscore_flag=''
    [[ ${_arch} == i686-w64-mingw32 ]] && underscore_flag='-DUSER_LABEL_PREFIX_UNDERSCORE'
    export CFLAGS="$underscore_flag"
    export CXXFLAGS="$underscore_flag"
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

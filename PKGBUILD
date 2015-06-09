# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-gettext
pkgver=0.19.4
pkgrel=4
arch=(any)
pkgdesc="GNU internationalization library (mingw-w64)"
depends=(mingw-w64-crt mingw-w64-libiconv mingw-w64-termcap mingw-w64-libunistring)
makedepends=(mingw-w64-gcc mingw-w64-configure)
options=(!strip !buildflags staticlibs)
license=("GPL")
url="http://www.gnu.org/software/gettext"
source=("http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz"{,.sig}
"00-relocatex-libintl-0.18.3.1.patch"
"05-always-use-libintl-vsnprintf.mingw.patch"
"06-dont-include-ctype-after-gnulibs-wctype.mingw.patch"
"07-fix-asprintf-conflict.mingw.patch")
md5sums=('d3511af1e604a3478900d2c2b4a4a48e'
         'SKIP'
         '397d7d6d4abd15a70edb3c9f2bab4cd2'
         '27852a388b8cf38188dc392c244230ff'
         'f69747f43f279b8a81286cfe5916b82f'
         '3ebccf730ec3377b068027eb2283afb2')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd gettext-$pkgver
	patch -p1 -i ${srcdir}/00-relocatex-libintl-0.18.3.1.patch
  patch -p0 -i ${srcdir}/05-always-use-libintl-vsnprintf.mingw.patch
  patch -p0 -i ${srcdir}/06-dont-include-ctype-after-gnulibs-wctype.mingw.patch
  patch -p0 -i ${srcdir}/07-fix-asprintf-conflict.mingw.patch
}

build() {
	cd gettext-${pkgver}
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--target=${_arch} \
			--disable-java \
			--disable-native-java \
			--disable-csharp \
			--enable-threads=win32 \
			--without-emacs
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
		make DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
		rm "$pkgdir/usr/${_arch}/bin/"{autopoint,gettext.sh,gettextize}
		rm -r "$pkgdir/usr/${_arch}/lib/gettext"
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}

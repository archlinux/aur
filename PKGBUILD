# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkgname=ncurses
pkgname=mingw-w64-${_pkgname}
pkgver=6.4
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library (mingw-w64)'
arch=('any')
url='https://www.gnu.org/software/ncurses/'
license=('MIT')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-regex' 'mingw-w64-libiconv')
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-${pkgver}.tar.gz"::"https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${pkgver}.tar.gz")
sha256sums=('6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
	cd "${srcdir}/ncurses-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		LIBS="$(${_arch}-pkg-config --libs regex) -liconv" ${_arch}-configure \
			--without-ada \
			--with-cxx \
			--with-cxx-shared \
			--with-shared \
			--with-normal \
			--without-pthread \
			--enable-pc-files \
			--disable-rpath \
			--enable-colorfgbg \
			--enable-ext-colors \
			--enable-ext-mouse \
			--disable-symlinks \
			--enable-warnings \
			--enable-assertions \
			--disable-home-terminfo \
			--enable-database \
			--enable-sp-funcs \
			--enable-term-driver \
			--enable-interop \
			--enable-widec \
			--without-manpages \
			--without-tests \
			--without-debug \
			--program-prefix=
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/ncurses-${pkgver}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		[[ -d "${pkgdir}/usr/lib" ]] && rm -rf "${pkgdir}/usr/lib"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}

# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkgname=ncurses
pkgname=mingw-w64-${_pkgname}
pkgver=6.5
pkgrel=3
pkgdesc='System V Release 4.0 curses emulation library (mingw-w64)'
arch=('any')
url='https://www.gnu.org/software/ncurses/'
license=('MIT')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-regex' 'mingw-w64-libiconv')
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-${pkgver}.tar.gz"::"https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${pkgver}.tar.gz")
sha256sums=('136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
	cd "${_srcdir}"
	sed -i 's/cross_compiling=maybe/cross_compiling=yes/' 'configure'
}

build() {
	cd "${_srcdir}"
	export CFLAGS+=' -std=gnu17'
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
		cd "${srcdir}/${_srcdir}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		[[ -d "${pkgdir}/usr/lib" ]] && rm -rf "${pkgdir}/usr/lib"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}

# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

_name=ncurses
_platform=x86_64-w64-mingw32

pkgname=mingw-w64-x86_64-$_name
pkgver=6.5
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library for amd64 platform (mingw-w64)"
arch=('x86_64')
url='https://www.gnu.org/software/ncurses/'
license=('MIT')
makedepends=('mingw-w64-gcc')
# depends=('mingw-w64-x86_64-libgnurx' 'mingw-w64-x86_64-libiconv')
provides=("mingw-w64-$arch-$_name=$pkgver")
conflicts=("mingw-w64-$_name")
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-$pkgver.tar.gz"::"https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz")
sha256sums=('136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6')

prepare() {
	cd "$srcdir/$_name-$pkgver"
    ./configure --build=x86_64-pc-linux-gnu \
		--host=$_platform --prefix=/usr/$_platform \
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
}    

build() {		
	cd "$srcdir/$_name-$pkgver"
	make
}

package() {
	cd    "$srcdir/$_name-$pkgver"
    make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 chmod 644
    rm -r "$pkgdir/usr/$_platform/share"   
	rm 	  "$pkgdir/usr/$_platform/lib/terminfo"
	rm	  "$pkgdir/usr/$_platform/bin/ncursesw6-config"
	mv    "$pkgdir/usr/lib/pkgconfig" "$pkgdir/usr/$_platform/lib/pkgconfig"
	rm -r "$pkgdir/usr/lib"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

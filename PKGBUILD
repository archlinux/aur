# Maintainer: f1she3 <f1sher@gmx.com>

pkgname=st-custom
_pkgname=st
pkgver=0.8.2
pkgrel=1
_patch_list_url=(https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff)
pkgdesc='A simple virtual terminal emulator for X - easily customizable version'
arch=('i686' 'x86_64')
url="https://st.suckless.org"
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'xcompmgr')
makedepends=('ncurses')
provides=('st')
conflicts=('st')
source=(https://dl.suckless.org/st/${_pkgname}-$pkgver.tar.gz)
install=${_pkgname}.install
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '9c5b4b4f23de80de78ca5ec3739dc6ce5e7f72666186cf4a9c6b614ac90fb285')

if [ ${#_patch_list_url[@]} -ne 0 ];
then
	# Add content of _patch_list_url to source array
	for i in "${_patch_list_url[@]}";
	do
		source+=("$i");
	done
fi
prepare() {
	cd $srcdir/${_pkgname}-$pkgver
	if [ ${#_patch_list_url[@]} -ne 0 ];
	then
		for i in "${_patch_list_url[@]}";
		do
			# Filter URL to get base name of patch
			patch -p1 -i $startdir/${i##*/};
		done
	fi
	# skip terminfo which conflicts with nsurses
	sed -i '/tic /d' Makefile
	if [ -f $startdir/config.h ];
	then
		cp $startdir/config.h config.h
	else
		cp config.def.h $startdir/config.h;
	fi
}

build() {
	cd $srcdir/${_pkgname}-$pkgver
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/${_pkgname}-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/${_pkgname}/README"
}

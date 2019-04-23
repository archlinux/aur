# Maintainer: f1she3 <f1sher@gmx.com>

pkgname=st-alpha
_pkgname=st
pkgver=0.8.2
pkgrel=1
patch_first=alpha
patch_first_ver=$pkgver
#patch_second=scrollback
#patch_second_ver=0.8
#patch_third=scrollback-mouse
#patch_third_ver=$patch_second_ver
pkgdesc='A simple virtual terminal emulator for X - with alpha, scrollback &
scrollback-mouse patches'
arch=('i686' 'x86_64')
url="https://st.suckless.org"
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'xcompmgr')
makedepends=('ncurses')
provides=('st')
conflicts=('st')
source=(https://dl.suckless.org/st/${_pkgname}-$pkgver.tar.gz
        config.h
	https://st.suckless.org/patches/$patch_first/$pkgname-$patch_first_ver.diff)
#https://st.suckless.org/patches/$patch_second/${_pkgname}-$patch_second-$patch_second_ver.diff
#https://st.suckless.org/patches/$patch_second/${_pkgname}-$patch_third-$patch_third_ver.diff)
install=${_pkgname}.install
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '88f3df5556965c4bf5b35e3c7661799a19fcea1ca6abfa62bbb6e684778b3b23'
            '9c5b4b4f23de80de78ca5ec3739dc6ce5e7f72666186cf4a9c6b614ac90fb285')

prepare() {
	cd $srcdir/${_pkgname}-$pkgver
	patch -p1 -i ../$pkgname-$patch_first_ver.diff
	# skip terminfo which conflicts with nsurses
	sed -i '/tic /d' Makefile
	cp $srcdir/config.h config.h
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

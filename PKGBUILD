# Maintainer: f1she3 <f1sher@gmx.com>

pkgname=st-alpha
_pkgname=st
pkgver=0.8.1
pkgrel=1
patch_first=alpha
patch_first_ver=$pkgver
patch_second=scrollback
patch_second_ver=0.8
patch_third=scrollback-mouse
patch_third_ver=$patch_second_ver
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
	https://st.suckless.org/patches/$patch_first/$pkgname-$patch_first_ver.diff
	https://st.suckless.org/patches/$patch_second/${_pkgname}-$patch_second-$patch_second_ver.diff
	https://st.suckless.org/patches/$patch_second/${_pkgname}-$patch_third-$patch_third_ver.diff)
install=${_pkgname}.install
sha256sums=('c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926'
            '9218189801a81e2429bb5efa3f1b032380ddf40ec5d8b895fe4ccea3b8c3bfd2'
            '7bf61cb8a505891574f3ad0a5420334d3e965b9f7d0067df3819eeef72ce1358'
            '8279d347c70bc9b36f450ba15e1fd9ff62eedf49ce9258c35d7f1cfe38cca226'
            '3fb38940cc3bad3f9cd1e2a0796ebd0e48950a07860ecf8523a5afd0cd1b5a44')

prepare() {
  cd $srcdir/${_pkgname}-$pkgver
  patch -p1 -i ../$pkgname-$patch_first_ver.diff
  patch -p1 -i ../${_pkgname}-$patch_second-$patch_second_ver.diff
  patch -p1 -i ../${_pkgname}-$patch_third-$patch_third_ver.diff
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

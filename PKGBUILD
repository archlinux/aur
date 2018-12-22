# Maintainer: f1she3 <f1sher@gmx.com>

pkgname=st-alpha
_pkgname=st
patchname=alpha
patchver=0.8.1
pkgver=0.8.1
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X - with alpha patch (custom opacity)'
arch=('i686' 'x86_64')
url="https://st.suckless.org"
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc' 'xcompmgr')
makedepends=('ncurses')
provides=('st')
conflicts=('st')
source=(https://dl.suckless.org/st/${_pkgname}-$pkgver.tar.gz
        config.h
	https://st.suckless.org/patches/$patchname/$pkgname-$patchver.diff)
install=${_pkgname}.install
sha256sums=('c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926'
            'bd630b1515be2a51b074720c37e39a6e7fc54cad59807064311cfc9cda0318c9'
            '7bf61cb8a505891574f3ad0a5420334d3e965b9f7d0067df3819eeef72ce1358')

prepare() {
  cd $srcdir/${_pkgname}-$pkgver
  patch -p1 -i ../$pkgname-$patchver.diff
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

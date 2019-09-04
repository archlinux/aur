# Maintainer: Brian BIdulock <bidulock@openss7.org>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>

pkgname=st-white
_pkgname=st
pkgver=0.8.2
pkgrel=2
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(http://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz config.h)
sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            'd2675fede628ce1db2bd57efde18bff74803f36219efb70886f2fb3ceab4e7a4')

prepare() {
  cd $_pkgname-$pkgver
  # user is supposed to maintain config.h him/herself
  cp $srcdir/config.h config.h
}

build() {
  cd $_pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  # remove to avoid conflict with ncurses
  rm "${pkgdir}/usr/share/terminfo/s/st" "${pkgdir}/usr/share/terminfo/s/st-256color" 
}

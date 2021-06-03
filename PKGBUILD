# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Christoph Vigano <mail@cvigano.de>

pkgname=st-white
_pkgname=st
pkgver=0.8.4
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses')
url="http://st.suckless.org"
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(http://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz config.h)
sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            '4ab25d63126a964a37653fc3f731f8cddb3603c5c8e3dcfbde87bbc06d564974')

prepare() {
  cd $_pkgname-$pkgver
  # user is supposed to maintain config.h him/herself
  cp ../config.h config.h
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

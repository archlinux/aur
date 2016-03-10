# Maintainer: Tudor Roman <xenogenesis at openmailbox dot org>
pkgname=st-xresources-git
pkgver=r4.8a8358d
pkgrel=1

pkgdesc='Simple terminal with Xresources support'
url='https://github.com/dcat/st-xresources'
arch=('i686' 'x86_64')
license=('MIT')

depends=('libxft' 'libxext')
makedepends=('ncurses')

provides=('st-xresources-git')
conflicts=('st')

source=('git://github.com/dcat/st-xresources' 'config.h')

md5sums=('SKIP' 'SKIP')

pkgver() {
  cd st-xresources
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-xresources
  # skip terminfo which conflicts with ncurses
  sed -i '/\@tic /d' Makefile
}

build() {
  cd st-xresources
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st-xresources
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}


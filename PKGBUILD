# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=duc-git
pkgver=1.4.4.r9.g1d46285
pkgrel=1
pkgdesc="collection of tools for inspecting and visualizing disk usage (git version)"
arch=('i686' 'x86_64')
url="http://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'sqlite' 'ncurses')
makedepends=('git')
provides=('duc')
conflicts=('duc')
source=("git+https://github.com/zevv/duc.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - .
}

prepare() {
  cd ${pkgname%-git}
  touch config.h.in
  sed -i 's+ncursesw/ncurses.h+ncurses.h+' src/duc/cmd-ui.c
}

build() {
  cd ${pkgname%-git}
  aclocal && autoconf && automake -a -f 
  ./configure --prefix=/usr --with-db-backend=sqlite3 
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}

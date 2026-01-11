# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=duc-git
pkgver=1.5.0.rc1.r0.ga58fa4e
pkgrel=1
pkgdesc="Collection of tools for inspecting and visualizing disk usage (git version)"
arch=('i686' 'x86_64')
url="https://duc.zevv.nl/"
license=('GPL2')
depends=('cairo' 'pango' 'sqlite' 'ncurses')
makedepends=('git')
provides=('duc')
conflicts=('duc')
source=("git+https://github.com/zevv/duc.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  touch config.h.in
  sed -i 's+ncursesw/ncurses.h+ncurses.h+' src/duc/cmd-ui.c
}

build() {
  cd "${pkgname%-git}"
  aclocal && autoconf && automake -a -f
  ./configure --prefix=/usr --with-db-backend=sqlite3
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}

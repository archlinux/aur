# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matthias Ellmer (halcyon)

pkgname=duc-git
pkgver=r951.a58fa4e
pkgrel=4
pkgdesc="Collection of tools for inspecting and visualizing disk usage (git version)"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://duc.zevv.nl/"
license=('LGPL-3.0-only')
depends=('cairo' 'pango' 'sqlite' 'ncurses' 'libx11' 'glib2' 'glibc')
makedepends=('git')
provides=('duc')
conflicts=('duc')
source=("git+https://github.com/zevv/duc.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  [[ ! -f config.h.in ]] && touch config.h.in
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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

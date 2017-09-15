# Contributor: Rasi <rasi@xssn.at>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ncmpc-git
pkgver=0.27.24.gdb8a107
pkgrel=1
pkgdesc="A fully featured MPD client, which runs in a terminal (using ncurses)." 
arch=('i686' 'x86_64')
url="http://www.musicpd.org/clients/ncmpc/"
license=('GPL')
depends=('ncurses' 'glib2' 'libmpdclient' 'python' 'expat')
makedepends=('git' 'meson')
conflicts=('ncmpc' 'ncmpc-svn')
source=("$pkgname::git+git://git.musicpd.org/master/ncmpc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/^v//g;s|-|.|g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's!ncursesw/curses.h!curses.h!g' meson.build
  sed -i 's!ncursesw/curses.h!curses.h!g' src/ncmpc_curses.h
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix /usr . output
  meson configure -Dartist_screen=true \
                  -Dchat_screen=true \
                  -Dcolors=auto \
                  -Dhelp_screen=true \
                  -Dkey_screen=true \
                  -Dlyrics_screen=true \
                  -Dmouse=true \
                  -Doutputs_screen=true \
                  -Dsearch_screen=true \
                  -Dsong_screen=true output
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR=$pkgdir ninja -C output install
} 


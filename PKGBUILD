# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=neetdraw-git
_pkgname=neetdraw
pkgver=r72.e08c63f
pkgrel=1
pkgdesc="Terminal drawing application with multiplayer support"
url="https://git.janouch.name/p/neetdraw"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('neetdraw')
provides=('neetdraw')
makedepends=('cmake' 'pkg-config' 'git')
depends=('libev' 'ncurses')
source=("git+https://git.janouch.name/p/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
}

build() {
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}

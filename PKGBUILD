# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=autistdraw-git
_pkgname=autistdraw
pkgver=r67.6964c61
pkgrel=1
pkgdesc="Terminal drawing application"
url="https://git.janouch.name/p/autistdraw"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('autistdraw')
provides=('autistdraw')
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

# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=hex-git
_pkgname=hex
pkgver=r79.252e349
pkgrel=1
pkgdesc="Hex viewer"
url="https://git.janouch.name/p/hex"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('hex')
provides=('hex')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('readline' 'ncurses' 'libunistring' 'lua')
source=("git+https://git.janouch.name/p/$_pkgname.git")
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
  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=None \
	  -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}

# Maintainer: Přemysl Janouch <p.janouch@gmail.com>
pkgname=uirc3-git
_pkgname=uirc3
pkgver=v0.9.2.r2.g28fec6d
pkgrel=1
pkgdesc="Experimental IRC client, daemon and bot"
url="https://github.com/pjanouch/uirc3"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('uirc3')
provides=('uirc3')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('openssl' 'readline' 'ncurses')
optdepends=('lua>=5.3: support for Lua plugins')
source=("git+https://github.com/pjanouch/$_pkgname.git")
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
  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}

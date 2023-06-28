# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=ponymap-git
_pkgname=ponymap
pkgver=r117.11567dc
pkgrel=1
pkgdesc="Experimental network scanner"
url="https://git.janouch.name/p/ponymap"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('ponymap')
provides=('ponymap')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('ncurses' 'jansson' 'openssl')
optdepends=('lua>=5.3: support for Lua plugins')
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
  cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}

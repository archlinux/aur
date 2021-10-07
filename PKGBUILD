# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=nncmpp-git
_pkgname=nncmpp
pkgver=v1.0.0.r13.g2675986
pkgrel=1
pkgdesc="MPD client"
url="https://git.janouch.name/p/nncmpp"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('nncmpp')
provides=('nncmpp')
makedepends=('cmake' 'pkg-config' 'git' 'asciidoctor')
depends=('readline' 'ncurses' 'libunistring' 'curl')
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
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
}

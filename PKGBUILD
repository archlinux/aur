# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=logdiag-git
_pkgname=logdiag
pkgver=v0.2.0.r4.g3102bc0
pkgrel=1
pkgdesc="Schematic editor"
url="https://git.janouch.name/p/logdiag"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('logdiag')
provides=('logdiag')
makedepends=('cmake' 'pkg-config' 'git')
depends=('gtk3' 'lua' 'json-glib')
install=logdiag.install
source=("git+https://git.janouch.name/p/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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

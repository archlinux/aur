# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=sdtui-git
_pkgname=sdtui
pkgver=r194.20fcf2a
pkgrel=1
pkgdesc="StarDict terminal UI"
url="https://git.janouch.name/p/sdtui"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('sdtui')
provides=('sdtui')
makedepends=('cmake' 'pkg-config' 'git' 'asciidoctor')
depends=('zlib' 'glib2' 'ncurses' 'pango')
optdepends=('libxcb: X11 selection watcher')
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
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

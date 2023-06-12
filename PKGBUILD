# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=tdv-git
_pkgname=tdv
pkgver=r300.d1ce970
pkgrel=1
pkgdesc="Translation dictionary viewer"
url="https://git.janouch.name/p/tdv"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('tdv')
provides=('tdv')
makedepends=('cmake' 'pkg-config' 'git' 'asciidoctor' 'librsvg')
depends=('zlib' 'glib2' 'ncurses' 'pango')
optdepends=('libxcb: X11 selection watcher' 'gtk3: GUI')
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

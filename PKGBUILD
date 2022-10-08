# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=xk-git
_pkgname=xK
pkgver=v1.5.0.r189.g26ed2db
pkgrel=1
pkgdesc="IRC daemon, bot, TUI client"
url="https://git.janouch.name/p/xK"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('xk')
provides=('xk')
makedepends=('cmake' 'pkg-config' 'git')
depends=('openssl' 'readline' 'ncurses' 'libffi')
optdepends=('lua: support for Lua plugins (5.3, 5.4 and possibly newer)')
source=("git+https://git.janouch.name/p/$_pkgname.git")
sha256sums=('SKIP')

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
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

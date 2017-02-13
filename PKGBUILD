# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=libpurple-lurch-git
_pkgname=lurch
pkgver=r31.3ac3915
pkgrel=1
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('i686' 'x86_64')
url="https://github.com/gkdr/lurch"
license=('GPL')
depends=('libpurple' 'mxml' 'libxml2' 'sqlite' 'libgcrypt')
source=("$_pkgname::git+https://github.com/gkdr/lurch.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  msg2 "Getting submodules"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  env PURPLE_PLUGIN_DIR="$pkgdir/usr/lib/purple-2" make -e install
}

# vim:set ts=2 sw=2 et:

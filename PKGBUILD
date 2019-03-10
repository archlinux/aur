# Contributor: eskimod
# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=libpurple-lurch-git
_pkgname=lurch
pkgver=v0.6.8.r0.g3f74880
pkgrel=2
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('i686' 'x86_64')
url="https://github.com/gkdr/lurch"
license=('GPL')
depends=('libpurple' 'mxml' 'libxml2' 'sqlite' 'libgcrypt')
makedepends=('git' 'cmake')
optdepends=('libpurple-carbons-git: message carbons support')
source=("$_pkgname::git+https://github.com/gkdr/lurch.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  msg2 "Getting submodules"
  # .gitmodules specifies relative paths that don't resolve correctly on a local clone
  git config --file=.gitmodules submodule."lib/axc".url "https://github.com/gkdr/axc"
  git config --file=.gitmodules submodule."lib/libomemo".url "https://github.com/gkdr/libomemo"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

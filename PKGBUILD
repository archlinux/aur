# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname="brisk-menu"
pkgname="$_pkgname-git"
pkgver=0.6.2.r3.g71cced4
pkgrel=3
pkgdesc="Modern, efficient menu for the MATE Desktop Environment"
url="https://github.com/getsolus/brisk-menu"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'libnotify'
  'mate-panel'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# Maintainer: MrGilfy <mrgilfy@duck.com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=leggio-git
_pkgname=leggio
pkgver=0.1.0.r1.g23e1048
pkgrel=1
pkgdesc="Sheet music viewer built for use at arm's length (git)"
arch=('any')
url="https://github.com/MrGilfy/leggio"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk4'
  'libadwaita'
  'poppler-glib'
  'hicolor-icon-theme'
)
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # 0.1.0.r17.gabc1234 — tag, commits since it, short hash. Falls back to
  # a 0.0.0 series if the clone has no tags yet.
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.g%s" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

# Maintainer: David Sultaniiazov <x1z53@alt-gnome.ru>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=libapi-base-git
pkgver=7.8.r2.gcbb9437
pkgrel=1
pkgdesc="Base objects for API libraries"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  json-glib
  libgee
  libsoup3
  libyaml
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson ${pkgname%-git} build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

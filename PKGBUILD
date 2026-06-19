# Maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=libcase-git
pkgver=0.1.r9.gc73e77c
pkgrel=1
pkgdesc="Library with various useful widgets"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glibc
  glib2
  gtk4
  libadwaita
)
makedepends=(
  blueprint-compiler
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

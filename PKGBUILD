# Maintainer: 0xMRTT <0xMRTT@tuta.io>

pkgname=schemes-git
pkgver=0.1.0.r49.gac770bb
pkgrel=1
pkgdesc="GtkSourceView style scheme creator and editor"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/chergert/schemes"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libpanel-git')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

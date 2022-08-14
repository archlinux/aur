# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=logistics-git
pkgver=r18.16ae35a
pkgrel=2
pkgdesc="Gtk/Python native Docker client for GNOME"
arch=('any')
url="https://github.com/cameronthecoder/logistics"
license=('GPL3')
depends=('libadwaita' 'docker' 'python-gobject')
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

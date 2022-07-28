# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=valent-git
pkgver=r607.24a038f
pkgrel=1
pkgdesc="Connect, control and sync devices"
arch=('x86_64' 'aarch64')
url="https://github.com/andyholmes/valent"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'evolution-data-server' 'gnutls' 'json-glib' 'libpeas' 'sqlite3' 'libsysprof-capture' 'gstreamer' 'libpulse')
makedepends=('git' 'meson' 'gobject-introspection')
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

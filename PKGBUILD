# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=endeavour-git
_pkgname=Endeavour
pkgver=41.0.r126.g7d1da12f
pkgrel=1
pkgdesc="Task manager for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Endeavour"
license=('GPL3')
groups=('gnome-extra')
depends=('evolution-data-server' 'libpeas' 'python' 'libportal-gtk4' 'libadwaita')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$_pkgname/data}"
  export GSETTINGS_SCHEMA_DIR
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

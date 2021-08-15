# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette-git
pkgver=r85.550623a
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('any')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-palette-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson ${pkgname%-palette-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}

# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk-git
_pkgname=random
pkgver=r198.4f67b85
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

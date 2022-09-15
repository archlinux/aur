# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk-git
_pkgname=random
pkgver=r365.d44b4bf
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('libadwaita>=1:1.2.0')
makedepends=('git' 'meson' 'gobject-introspection' 'vala')
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

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

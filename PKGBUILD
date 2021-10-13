# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=patterns-git
pkgver=r51.02394e9
pkgrel=1
pkgdesc="GNOME patterns"
arch=('x86_64')
url="https://gitlab.gnome.org/exalm/patterns"
license=('MIT' 'LGPL')
depends=('glib2' 'gtk4' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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

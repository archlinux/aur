# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=countdown-git
pkgver=r35.001f526
pkgrel=1
pkgdesc="Track events until they happen or since they happened"
arch=('x86_64' 'aarch64')
url="https://github.com/lainsce/countdown"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
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

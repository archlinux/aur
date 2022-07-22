# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner-git
pkgver=r166.17734a5
pkgrel=1
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather' 'geocode-glib' 'protobuf' 'protobuf-c')
makedepends=('git' 'meson')
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

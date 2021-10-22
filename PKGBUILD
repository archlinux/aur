# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passport-git
pkgver=r18.c5b980a
pkgrel=1
pkgdesc="GTK4 frontend for GNU pass"
arch=('x86_64')
url="https://github.com/matze/passport"
license=('MIT')
depends=('gtk4' 'glib2' 'pass')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

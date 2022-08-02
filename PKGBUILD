# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gambito-git
pkgver=r73.9d5bb81
pkgrel=1
pkgdesc="Chess Game"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/danigm/gambito"
license=('GPL3')
depends=('libadwaita' 'stockfish')
makedepends=('git' 'meson' 'cargo')
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

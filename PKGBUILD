# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=game-of-life-git
pkgver=0.1.2.r14.g5d62c57
pkgrel=1
pkgdesc="A simulator of Conway's game of life"
arch=('x86_64' 'aarch64')
url="https://github.com/sixpounder/game-of-life"
license=('GPL3')
depends=('libadwaita')
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

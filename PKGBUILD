# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tactics-git
pkgver=0.2.r1.ga053954
pkgrel=1
pkgdesc="Build your soccer lineup"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/leesonwai/tactics"
license=('GPL3')
depends=('libadwaita')
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

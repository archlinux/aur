# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote-git
pkgver=r69.ee0e795
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
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
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

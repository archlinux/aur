# Maintainer: Your Name <youremail@domain.com>
pkgname=sharmavid-git
pkgver=r33.35f0334
pkgrel=1
pkgdesc="Invidio.us client using Gtk and Rust"
arch=('x86_64')
url="https://gitlab.gnome.org/ranfdev/sharmavid"
license=('')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
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
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

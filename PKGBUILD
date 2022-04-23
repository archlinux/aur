# Maintainer: Your Name <youremail@domain.com>
pkgname=terminal-git
pkgver=42.alpha1.r1.gfae77ff
pkgrel=1
pkgdesc="A beautiful and simple GTK 4 terminal"
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/terminal"
license=('GPL3')
depends=('glib2' 'libadwaita' 'libmarble-git' 'vte4-git' 'json-glib' 'pcre')
makedepends=('git' 'meson' 'vala')
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

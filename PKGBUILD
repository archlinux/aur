# Maintainer: Your Name <youremail@domain.com>

pkgname=libmarble-git
_pkgname=marble
pkgver=1.3.0.r4.g6dcc6fe
pkgrel=2
pkgdesc="Custom GTK library"
arch=('x86_64')
url="https://gitlab.com/raggesilver/marble"
license=('GPL3')
depends=('glib2' 'gtk4')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git#branch=wip/gtk4)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

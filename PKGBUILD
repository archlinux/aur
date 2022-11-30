# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=metainfo-builder-git
pkgver=r14.50f80bb
pkgrel=1
pkgdesc="A small application to edit and create AppStream metadata files"
arch=('any')
url="https://gitlab.gnome.org/ebassi/metainfo-builder"
license=('Apache')
depends=('libadwaita' 'appstream' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib' 'reuse' 'flake8' 'mypy')
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

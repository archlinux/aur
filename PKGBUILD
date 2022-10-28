# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=blueprintgtk-git
pkgver=r7.2cd9464
pkgrel=1
pkgdesc="A tool for migrating ui/xml to blueprint files"
arch=('any')
url="https://gitlab.gnome.org/tijder/blueprintgtk"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'blueprint-compiler')
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

# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=boards-git
_pkgname=Boards
pkgver=r90.3600c65
pkgrel=1
pkgdesc="Boards is a project organizer application that offers TODO and project organizing boards for GNOME."
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/smonder/Boards"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'libxml2')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

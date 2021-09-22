# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-cowsay-git
_pkgname=cowsay
pkgver=1.9.0.r0.g2940e97
pkgrel=1
pkgdesc="A simple GNOME UI implementation of Cowsay"
arch=('x86_64')
url="https://gitlab.gnome.org/Eonfge/cowsay"
license=('GPL3')
depends=('gtk3' 'glib2' 'libgee' 'libsoup' 'json-glib' 'sqlite3')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "cowsay")
replaces=('cowsay')
source=(git+$url.git)
sha256sums=('SKIP')

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
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

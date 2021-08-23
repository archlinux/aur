# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien-git
_pkgname=Chirurgien
pkgver=1.0.r7.g10da91c
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('any')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

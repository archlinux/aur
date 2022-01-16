# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hibernate-git
_pkgname=gnome-shell-hibernate-extension
pkgver=r21.8282cf1
pkgrel=1
pkgdesc="A GNOME extension that adds the option to hibernate amongst other system actions"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-hibernate-extension"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
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
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

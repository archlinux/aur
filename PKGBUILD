# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=password-for-gnome-vala-git
pkgver=r69.6ffd937
pkgrel=1
pkgdesc="Calculator and random generator password for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/elescoute/password-for-gnome-vala"
license=('GPL3')
depends=('libadwaita' 'libsoup3')
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# Maintainer: Your Name <youremail@domain.com>
pkgname=gnome-loop-git
_pkgname=loop
pkgver=0.1.0.r2.ge818787
pkgrel=1
pkgdesc="A simple audio loop machind for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/danigm/loop"
license=('GPL3')
depends=(gtk4 libadwaita)
makedepends=(meson python)
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

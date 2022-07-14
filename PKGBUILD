# Maintainer: Your Name <youremail@domain.com>

pkgname=blurble-git
_pkgname=Blurble
pkgver=0.1.0.r3.g9170f7c
pkgrel=1
pkgdesc="Word guessing game"
arch=('x86_64')
url="https://gitlab.gnome.org/pervoj/Blurble"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'blueprint-compiler' 'vala')
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

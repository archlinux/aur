# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=splash-git
pkgver=r17.d1739db
pkgrel=1
pkgdesc="A Unsplash wallpaper application for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/Bharatkalluri/splash"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  git+$url.git
  2.patch)
b2sums=('SKIP'
        '1797f930e07b5a97598b951f7539ed86c6d4a21f242e44322d806d7b139ec841a66c5af580c3d308c8ab0b6cfee05e4d64bdd49a61bb4092ee5d2b0724944a87')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/2.patch"
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

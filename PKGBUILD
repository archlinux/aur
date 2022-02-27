# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=wordbook-git
_author=fushinari
_gitname=Wordbook
pkgver=0.3.1.r4.g0ce26e2
pkgrel=1
pkgdesc='An offline dictionary app for GNOME'
arch=(any)
url=https://github.com/fushinari/Wordbook
license=(GPL3)
depends=(
    espeak-ng
    gtk3
    libhandy
    python
    python-gobject
    python-wn
)
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson $_gitname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

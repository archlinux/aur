# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=noteworthy-git
_pkgname=Noteworthy
pkgver=r491.b6107c5
pkgrel=1
pkgdesc="Powerful yet simple and fast markdown-based and version-controlled note organizing app"
arch=('x86_64')
url="https://github.com/SeaDve/Noteworthy"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gtksourceview5' 'gdk-pixbuf2' 'gstreamer' 'gst-plugins-base')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha512sums=('SKIP')

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
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}


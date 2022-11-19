# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=noteworthy-git
pkgver=r866.4b78260
pkgrel=1
pkgdesc="Powerful yet simple and fast markdown-based and version-controlled note organizing app"
arch=('x86_64' 'aarch64')
url="https://github.com/SeaDve/Noteworthy"
license=('GPL3')
depends=('libadwaita' 'libpulse' 'gtksourceview5' 'gstreamer' 'gst-plugins-base')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')
options=('!lto')

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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}


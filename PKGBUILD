# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tooth-git
pkgver=r460.3bd79d0
pkgrel=1
pkgdesc="A GTK Mastodon Client - Fork of Tootle"
arch=('x86_64' 'aarch64')
url="https://github.com/GeopJr/Tooth"
license=('GPL3')
depends=('libadwaita' 'json-glib' 'libxml2' 'libgee' 'libsoup' 'libsecret')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

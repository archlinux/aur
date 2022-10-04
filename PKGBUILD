# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder-git
pkgver=r505.20924bd
pkgrel=1
pkgdesc="Securely delete your files"
arch=('x86_64' 'aarch64')
url="https://github.com/ADBeveridge/raider"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'itstool' 'blueprint-compiler' 'gobject-introspection' 'gi-docgen')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-file-shredder-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-file-shredder-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-file-shredder-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

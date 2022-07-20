# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note-git
_pkgname=paper
_app_id=io.posidon.Paper
pkgver=r229.5b602d0
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('git' 'meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
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
  
  # Temporary solution to the issue: https://gitlab.com/posidon_software/paper/-/issues/36
  mv "$pkgdir/usr/share/applications/$_app_id.desktop" "$pkgdir/usr/share/applications/Paper.desktop"
}

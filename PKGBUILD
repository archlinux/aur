# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
pkgver=22.10
_app_id=io.posidon.Paper
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-note}-$pkgver.tar.gz)
b2sums=('8389ef4fd89c901f9cdf1494fced3a491451554e844178dc2ae7c72bde3c4e4de6d2eebecfc9bf8f8ad5ae4b733e283eb73fa4f02a1bd2650ce870b7c2f2beed')

build() {
  arch-meson "${pkgname%-note}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Temporary solution to the issue: https://gitlab.com/posidon_software/paper/-/issues/36
  mv "$pkgdir/usr/share/applications/$_app_id.desktop" "$pkgdir/usr/share/applications/Paper.desktop"
}

# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
pkgver=22.10
pkgrel=2
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-note}-$pkgver.tar.gz
  0260-Fix-36.patch)
b2sums=('8389ef4fd89c901f9cdf1494fced3a491451554e844178dc2ae7c72bde3c4e4de6d2eebecfc9bf8f8ad5ae4b733e283eb73fa4f02a1bd2650ce870b7c2f2beed'
        'de30f28ad4823fcf576a8a3766d2e2c86b8abbe29bc061a5ea8a894a1c3de225d23f9540b5d1e1e298e98a38b605bf0e0c92bd3bbee7243419cd564f38c49eb6')

prepare() {
  # Temporary solution to the issue: https://gitlab.com/posidon_software/paper/-/issues/36
  cd "${pkgname%-note}-$pkgver"
  patch -p1 -i ../0260-Fix-36.patch
}

build() {
  arch-meson "${pkgname%-note}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

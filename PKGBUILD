# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender-git
pkgver=0.7.1.r0.g271e614
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/floers/karlender"
license=('GPL3')
depends=('libadwaita' 'libnotify')
makedepends=('git' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"

  cargo build --release --locked
}

package() {
  cd "${pkgname%-git}"

  sed -i 's|ROOT=/app|ROOT=/usr|g' target/gra-gen/Makefile

  make -C target/gra-gen ROOT="$pkgdir/usr" install
  make -C target/gra-gen ROOT="$pkgdir/usr" install-gsettings

  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}

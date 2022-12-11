# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b09ff0015111bcd895f7bae74cb04e7dc931bda22fe7ae62b852fec1a72ddd2c')

prepare() {
  cd "ProtonPlus-$pkgver"

  # Correct desktop file category
  sed -i 's/Games;/Game;/g' data/com.vysp3r.ProtonPlus.desktop
}

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build

  cd "ProtonPlus-$pkgver"
  appstream-util validate-relax --nonet data/*.appdata.xml
  desktop-file-validate data/*.desktop
}

package() {
  meson install -C build --destdir "$pkgdir"
}

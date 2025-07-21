# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-lookup
_app_id=com.github.johnfactotum.QuickLookup
pkgver=2.1.2
pkgrel=1
pkgdesc="Simple GTK dictionary application powered by Wiktionary"
arch=('any')
url="https://github.com/johnfactotum/quick-lookup"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('040d3570e5799396ef728402242ab06d8b7dfda4f365a5ae9d20e28d95c4f701')

prepare() {
  cd "$pkgname-$pkgver"

  # Correct version
  sed -i "s/2.1.0/$pkgver/g" meson.build
}

build () {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "${_app_id}.appdata.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"
}

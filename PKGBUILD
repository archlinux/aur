# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=conjure
_app_id=io.github.nate_xyz.Conjure
pkgver=0.1.2
pkgrel=2
pkgdesc="Magically transform your images."
arch=('any')
url="https://github.com/nate-xyz/conjure"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'python-gobject'
  'python-loguru'
  'python-wand'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1866d146217ca47219f42c2e415bd597f301e29a25b4a454c022827f6c16788e')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/Exec=$pkgname/Exec=${_app_id}/g" "data/${_app_id}.desktop.in"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Conflicts with imagmagick 'conjure' binary
  mv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/${_app_id}"
}

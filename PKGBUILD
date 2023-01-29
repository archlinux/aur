# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.3
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver".tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('e7602df3d1a74dc5439ad1d9f9960c253f2f36bc4c13608e3c645e06425f3ab8c2416430d1c306cc169d961392094ae761448b7e0c46466e305c3bd3aa0c6255')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

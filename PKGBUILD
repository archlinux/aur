# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
pkgver=0.6.1
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('0821c87991793421df1caef069ae16a8f3c07219807e25785f5eef5a737a4dd117dcbf61ef96dbb3b832cb9df53446511feacb1fdd489e8b1fad51e2f0dbb6d7')

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

# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
pkgver=0.11.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('cebf1055003e481bfccb3830b3294d2a3d9445798723ab593a2200e03b0b5b8a86bbf7ec329f6f4492cd5b5dc7c3836386e67883003e529e98af3618fc2fb6ed')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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

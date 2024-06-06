# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
pkgver=0.7.1
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('3aadd79d4c1e76cb01625aadfd6425ba0ce423e146ef93f367c078cc46ca5c8672add7292a094d89813c5d400fe03eb224c9c6836cb90bf089cf700d7fab803b')

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

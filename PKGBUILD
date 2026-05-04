# Maintainer: Ben Wyrosdick <ben@vesyl.com>
pkgname=openusage-waybar
pkgver=0.6.9
pkgrel=1
pkgdesc="Waybar module for tracking AI coding subscription usage"
arch=('x86_64')
url="https://github.com/benwyrosdick/openusage-waybar"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')   # replace after first tag

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin openusage-waybar
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/openusage-waybar "$pkgdir/usr/bin/openusage-waybar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r plugins "$pkgdir/usr/share/openusage/plugins"
}

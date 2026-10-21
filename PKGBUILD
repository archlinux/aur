# Maintainer: Alex Krieger <alex@ai-krieger.de>
pkgname=aurelia-tui
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal UI for the Aurelia Steam CLI - browse, install, update, and launch Steam games"
arch=('x86_64' 'aarch64')
url="https://github.com/Drackrath/Aurelia-TUI"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl' 'aurelia>=0.1.40')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b48555d45192b7e23f10b4917d5494beba0d884684f0e062943edd65272a82f0')

prepare() {
  cd "Aurelia-TUI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Aurelia-TUI-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "Aurelia-TUI-$pkgver"
  cargo test --frozen --release
}

package() {
  cd "Aurelia-TUI-$pkgver"
  install -Dm755 "target/release/aurelia-tui" "$pkgdir/usr/bin/aurelia-tui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

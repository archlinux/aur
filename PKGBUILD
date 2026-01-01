# Maintainer: aman-sanin
pkgname=phantimer
pkgver=0.1.0
pkgrel=1
pkgdesc="A ghost timer window spawner for Hyprland"
arch=('x86_64')
url="https://github.com/aman-sanin/phantimer"
license=('MIT')
depends=('gcc-libs' 'hyprland') # Hyprland is a runtime dependency
optdepends=('foot: The default terminal emulator used')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cb26c501570443c92043f5aacff3a174f25def189564bd001f26674b6613d41')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install the license (Required by Arch policy)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # (Optional) Install README if you want
  #install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

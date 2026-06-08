# Maintainer: Your Name <your_email@example.com>
pkgname=phantimer
pkgver=0.1.1
pkgrel=1
pkgdesc="A ghost timer window spawner for Hyprland"
arch=('x86_64')
url="https://github.com/aman-sanin/phantimer"
license=('MIT')
depends=('gcc-libs' 'hyprland') # Hyprland is a runtime dependency
optdepends=('foot: The default terminal emulator used')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9cfef014f43802a22287f8282d48957834e804c6d99dad5e9dfa0abb762327d6')

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

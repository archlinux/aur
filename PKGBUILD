# Maintainer: Your Name <your@email.com>
pkgname=laptop-standby
pkgver=0.1.0
pkgrel=1
pkgdesc="Rust-based daemon for managing laptop power states"
arch=('x86_64')
url="https://github.com/Historya/$pkgname"
license=('MIT')
depends=('dbus' 'systemd')
makedepends=('rust' 'cargo' 'git')
checkdepends=('cargo')
options=('!lto')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
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
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
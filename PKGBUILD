# Maintainer: Petr Kracik <petrkr@petrkr.net>
pkgname=nostr-rs-relay
pkgver=0.8.9
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A relay implementation for the Nostr protocol"
url="https://sr.ht/~gheartsfield/nostr-rs-relay/"
license=('MIT')
source=("https://git.sr.ht/~gheartsfield/$pkgname/archive/$pkgver.tar.gz")
backup=("etc/nostr-rs-relay/config.toml")

sha256sums=("a497340760fc99745fdb42c7ea04013d25bc57e50ca4749887129361866a98fa")

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  # Tweek systemd service
  sed "s|User.*|User=nostr-rs-relay|" contrib/nostr-rs-relay.service > target/release/nostr-rs-relay.service
  sed "s|WorkingDirectory.*|WorkingDirectory=/var/lib/nostr-rs-relay|" -i target/release/nostr-rs-relay.service
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
 install=nostr-rs-relay.install
 
# Create database directory
  install -dm0755 "$pkgdir/var/lib/nostr-rs-relay"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/etc/nostr-rs-relay/" "$pkgname-$pkgver/config.toml"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname-$pkgver/target/release/nostr-rs-relay.service"
  }

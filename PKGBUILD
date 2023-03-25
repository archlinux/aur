# Maintainer: Michael Dilger <mike@mikedilger.com>
# Maintainer: soloturn@gmail.com

pkgname=gossip
pkgver=0.5.2
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
makedepends=(cargo git mold)
provides=($pkgname)
conflicts=($pkgname)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mikedilger/gossip/archive/refs/tags/v${pkgver}.tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '18cbbc23f08d2357b7ef1167385fb21714d2d2c9468ee4e20f0f50bc77597152'
  'cf28c5863c0f5f6766d98cb18189761f95f2a0a7c166a39afa4ffa2578a703af'
)

#prepare() {
#  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
#}

build() {
  cd $pkgname-$pkgver
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native --cfg tokio_unstable"
  # cargo build --frozen --release --all-features
  cargo build --release --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "gossip.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

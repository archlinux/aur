# Maintainer: Michael Dilger <mike@mikedilger.com>
# Maintainer: soloturn@gmail.com

pkgname=gossip
pkgver=0.12.0
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
conflicts=(ffmpeg-git)
makedepends=(cargo clang cmake ffmpeg git mold)
optdepends=(xdg-utils)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mikedilger/gossip/archive/refs/tags/v${pkgver}.tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '18cfc089b7f453202eb845f199590c98544d2b5dd60281368ae1a31f62b4d2ff'
  'cf28c5863c0f5f6766d98cb18189761f95f2a0a7c166a39afa4ffa2578a703af'
)

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native --cfg tokio_unstable"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native --cfg tokio_unstable"
  cargo build --locked --offline --release --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "logo/gossip.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

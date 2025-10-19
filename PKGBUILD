# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.4.2
pkgrel=1
pkgdesc="Play website videos and songs with mpv & yt-dlp."
arch=("x86_64")
depends=("mpv")
optdepends=(
  "yt-dlp: ytdl-hook support"
)
makedepends=("cargo" "git")
install="mpv-handler.install"
url="https://github.com/akiirui/mpv-handler/"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/mpv-handler/archive/v$pkgver.tar.gz")
b2sums=('88ac7a6c1f5decc8620845fa4c6f425df7b298860d1bb35a88a53f9a3a080ed7836e27bd59fdb6023582336371d4a6425d10bfe1fe223d4f3b0aa1180af06f3e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/mpv-handler" "$pkgdir/usr/bin/mpv-handler"
  install -Dm644 "share/linux/config.toml" "$pkgdir/usr/share/doc/mpv-handler/config.toml"
  install -Dm644 "share/linux/mpv-handler.desktop" "$pkgdir/usr/share/applications/mpv-handler.desktop"
  install -Dm644 "share/linux/mpv-handler-debug.desktop" "$pkgdir/usr/share/applications/mpv-handler-debug.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

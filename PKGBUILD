# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.3.8
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
b2sums=('3b6188ecb5c1169681ae6a7d603380e638889cec2ec6a3cddd736fc2757b95daa224b145202eb34207288224d3fe9ddb6277becc75db3e6b403612841ac8128f')

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

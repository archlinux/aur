# Maintaner: blob42 <contact@blob42.xyz>

pkgname=aichat-ng
pkgver=0.19.0
pkgrel=1
pkgdesc="OpenAI, ChatGPT, ollama and more in your terminal"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/blob42/aichat-ng"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
conflicts=('aichat-bin' 'aichat-git' 'aichat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6af85a193524fb9b0036bdeae7d66e38fe39604de8291197a63f3f23c5c3408c')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export RUSTFLAGS="$RUSTFLAGS \
      -C link-arg=-fuse-ld=mold"

  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "target/release/$pkgname" -T "$pkgdir/usr/bin/aichat"

  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

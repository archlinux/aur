# Maintaner: blob42 <contact@blob42.xyz>

pkgname=aichat-ng
pkgver=0.29.1
pkgrel=1
pkgdesc="OpenAI, ChatGPT, ollama and more in your terminal. Fork with advanced features."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/blob42/aichat-ng"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
conflicts=('aichat-bin' 'aichat-git' 'aichat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18d74d59dca762404a5eb36a8b5b647fe3cf0cbb3530460f08fdca2968e3e737')

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

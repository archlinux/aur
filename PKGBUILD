# Maintaner: blob42 <contact@blob42.xyz>

pkgname=aichat-ng
pkgver=0.32.0
pkgrel=1
pkgdesc="OpenAI, ChatGPT, ollama and more in your terminal. Fork with advanced features."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/blob42/aichat-ng"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
conflicts=('aichat-bin' 'aichat-git' 'aichat')
provides=('aichat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19a0d44d37c28126fa3058649b875daa455aea28d97a47a5c758e8c671c58225')

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

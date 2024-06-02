# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=aichat
pkgver=0.18.0
pkgrel=1
pkgdesc="OpenAI, ChatGPT, ollama and more in your terminal"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
conflicts=('aichat-bin' 'aichat-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('94bc8b23b9c223e3a4191ec5c530fb4c26d5437f3a1a8ed895aa1e2f4dab49a2')

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

  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

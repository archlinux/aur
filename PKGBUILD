# Maintainer: Marvin Zhang <marvin.beeblebrox@gmail.com>
pkgname=z85
pkgver=0.1.0
pkgrel=1
pkgdesc="A base64-compatible Z85 CLI tool written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/nirvam/z85"
license=('MIT')
options=('!debug')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc1e1a1462cd850adc493a33ea0fe953a1d4d968313dcc8016b2de9e5da5f9c2')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -Vv | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/z85 "$pkgdir/usr/bin/z85"
  install -Dm644 z85.1 "$pkgdir/usr/share/man/man1/z85.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Shell completions
  install -Dm644 completions/bash/z85 "$pkgdir/usr/share/bash-completion/completions/z85"
  install -Dm644 completions/zsh/_z85 "$pkgdir/usr/share/zsh/site-functions/_z85"
  install -Dm644 completions/fish/z85.fish "$pkgdir/usr/share/fish/vendor_completions.d/z85.fish"
}

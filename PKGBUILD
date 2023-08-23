# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=wazzup
pkgver=0.4.1
pkgrel=1
pkgdesc="Very opinionated Rust WASM project builder"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dnaka91/wazzup"
license=('AGPL3')
depends=('binaryen' 'dart-sass' 'gcc-libs' 'rustup')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a46be24d1b7bdd780db5ec0f393732fcaa02ae3a592680f4f16ac534f19e28ef54647e08eb84a9517d8f26c7baaec6cbfce05db5805b9f80361af87e580fc9b4')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}/
  ./target/release/"$pkgname" completions bash > "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  ./target/release/"$pkgname" completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
  ./target/release/"$pkgname" completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/man/man1/
  ./target/release/"$pkgname" manpages "$pkgdir"/usr/share/man/man1
}

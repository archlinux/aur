# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=protomd
pkgver=0.2.2
pkgrel=1
pkgdesc="Protobuf Markdown generator"
arch=('aarch64' 'x86_64')
url="https://forge.dnaka91.rocks/dnaka91/$pkgname"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4ac78de619f923ed0261178b5f4b015032b254ad08b92d429ab347a41dedfa167716460acda253ea0b0e0bbce5d23a59d888e1f0222a37dcc26def174d80b3d1')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"

  ./target/release/"$pkgname" completion completion
  install -dm 755 "$pkgdir"/usr/share/{bash-completion/completions,elvish/lib,fish/vendor_completions.d,nushell/vendor/autoload,zsh/site-functions}/
  install -Dm 644 completion/"$pkgname".bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  install -Dm 644 completion/"$pkgname".elv -t "$pkgdir"/usr/share/elvish/lib
  install -Dm 644 completion/"$pkgname".fish -t "$pkgdir"/usr/share/fish/vendor_completions.d
  install -Dm 644 completion/"$pkgname".nu -t "$pkgdir"/usr/share/nushell/vendor/autoload
  install -Dm 644 completion/_"$pkgname" -t "$pkgdir"/usr/share/zsh/site-functions

  install -dm 755 "$pkgdir"/usr/share/man/man1/
  ./target/release/"$pkgname" manpages "$pkgdir"/usr/share/man/man1
}

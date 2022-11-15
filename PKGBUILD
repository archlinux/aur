# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=cargo-hatch
pkgver=0.4.1
pkgrel=1
pkgdesc="Hatch new projects like a chick coming out of its egg"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dnaka91/cargo-hatch"
license=('AGPL3')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo' 'git' 'libgit2' 'libssh2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e612c6fb4565712b47d72d01ae801d042642108c43cdf011a86db70cfbb3f9dcdecd0d4bafe1c07ce9cb9e6ddd22c4d73e6327594d10544e0756cf1c73174370')

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
  ./target/release/"$pkgname" hatch completions bash > "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  ./target/release/"$pkgname" hatch completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
  ./target/release/"$pkgname" hatch completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/man/man1/
  ./target/release/"$pkgname" hatch manpages "$pkgdir"/usr/share/man/man1
}

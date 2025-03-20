# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=typeshare
pkgver=1.13.2
pkgrel=1
pkgdesc='Command line tool for generating files with typeshare'
arch=(x86_64)
url="https://github.com/1Password/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8f90155b69c069822f5da19cfe018b0bc86c5318877020c8fa77a569b48f76f1d19bff14d148a5eb00e70108bb53ab466ba296cfc0440df3b9b852b7e92a593c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked

  # Generate shell completions using the freshly built binary
  target/release/$pkgname completions bash > $pkgname.bash
  target/release/$pkgname completions elvish > $pkgname.elv
  target/release/$pkgname completions fish > $pkgname.fish
  target/release/$pkgname completions zsh > $pkgname.zsh
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT

  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/elvish/lib" "$pkgname.elv"
  install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" "$pkgname.fish"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab

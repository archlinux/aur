# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=typeshare
pkgver=1.13.3
pkgrel=1
pkgdesc='Command line tool for generating files with typeshare'
arch=(x86_64)
url="https://github.com/1Password/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('853806d1a5eb824fd520963b58da091c793442936f81edc474051dc74a9f324bddc553a0b15d536bcdab45f1cdd06562525077284ad1bd564d013b3c05d867c0')

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

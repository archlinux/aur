# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=typeshare
pkgver=1.13.4
pkgrel=1
pkgdesc='Command line tool for generating files with typeshare'
arch=(x86_64)
url="https://github.com/1Password/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b3ef5fd0745b8101bf8fc37b8aba9f62506125f2f5ea52b70ea95509e64d9542b20da9d25d2c63c25f2aa1d7e7aa52faeaf37179f3f3270a6ea08ab0bf2a496c')

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

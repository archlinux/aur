# Maintainer: aquabeam <laithbahodi@gmail.com>

pkgname=org-rust
pkgver=0.1.3
pkgrel=1
url=https://github.com/hydrobeam/org-rust
pkgdesc='CLI tool for converting Org-Mode documents to other formats'
arch=('x86_64')
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=(SKIP)

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  find target/release -name "$pkgname.fish" | xargs dirname > out_dir
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "$pkgname"

  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$OUT_DIR/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "$OUT_DIR/$pkgname".bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$OUT_DIR/$pkgname".fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$OUT_DIR/$pkgname".1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

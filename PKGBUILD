# Maintainer: Sergey A. <murlakatamenka@disroot.org>
# shellcheck disable=SC2034,SC2164

pkgname=intermodal
pkgver=0.1.14
pkgrel=2
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
makedepends=(cargo help2man libgit2 libssh2)
conflicts=(intermodal-bin)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4b42fc39246a637e8011a520639019d33beffb337ed4e45110260eb67ecec9cb')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen

  # completions and man pages
  cargo run --package gen -- --bin target/release/imdl completion-scripts
  cargo run --package gen -- --bin target/release/imdl man
  cargo run --package gen -- --bin target/release/imdl book
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -Dm 755 "target/release/imdl" "$pkgdir/usr/bin/imdl"

  # shell completions
  install -Dm644 "target/gen/completions/_imdl" "$pkgdir/usr/share/zsh/site-functions/_imdl"
  install -Dm644 "target/gen/completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
  install -Dm644 "target/gen/completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

  # man pages
  install -Dm644 target/gen/man/*.1 -t "$pkgdir/usr/share/man/man1/"

  # book
  pushd book/src
  find . -name '*.md' -exec \
    install -Dm 644 {} "$pkgdir/usr/share/doc/$pkgname/book/{}" \;
  popd

  # license
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all
}

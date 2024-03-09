# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=srgn
pkgver=0.11.0
pkgrel=1
pkgdesc="A code surgeon for precise text and code transplantation"
url="https://github.com/alexpovel/srgn"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/srgn-v$pkgver.tar.gz")
sha256sums=('82b0fe9282293ce2a132769e0ad4640d531c08d43b23798e2a51ec917a89853c')

_archive="$pkgname-srgn-v$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  # Completions
  ./target/release/srgn --completions bash > srgn.bash
  ./target/release/srgn --completions fish > srgn.fish
  ./target/release/srgn --completions zsh > srgn.zsh
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/srgn

  install -Dm644 srgn.bash "$pkgdir/usr/share/bash-completion/completions/srgn"
  install -Dm644 srgn.fish "$pkgdir/usr/share/fish/vendor_completions.d/srg.fish"
  install -Dm644 srgn.zsh "$pkgdir/usr/share/zsh/site-functions/_srgn"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

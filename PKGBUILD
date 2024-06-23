# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mirrord
pkgver=3.106.0
pkgrel=1
pkgdesc="Connect your local process and your cloud environment, and run local code in cloud conditions"
url="https://github.com/metalbear-co/mirrord"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo-nightly
  clang
  protobuf
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4358f4129e0441ddfa5e70f61da895db77de5ac0dc1f32e5a096dd376f41235c')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=nightly

  # Update ahash to avoid the following compilation error in v0.8.6:
  # error[E0635]: unknown feature `stdsimd`
  cargo update --package ahash --precise 0.8.7

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --package mirrord

  # Completions
  ./target/release/mirrord completions bash > mirrord.bash
  ./target/release/mirrord completions fish > mirrord.fish
  ./target/release/mirrord completions zsh > mirrord.zsh
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/mirrord

  install -Dm644 mirrord.bash "$pkgdir/usr/share/bash-completion/completions/mirrord"
  install -Dm644 mirrord.fish "$pkgdir/usr/share/fish/vendor_completions.d/mirrord.fish"
  install -Dm644 mirrord.zsh "$pkgdir/usr/share/zsh/site-functions/_mirrord"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

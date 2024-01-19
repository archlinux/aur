# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=mirrord
pkgver=3.84.1
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('182f5b4c32e5d60ce25de2986592422a4c9392d344b9f7deb28d6ba6bcbdaecb')
options=(!lto)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=nightly
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

# Tests require running a Minikube cluster as far as am aware.
# check() {
#   cd "$_archive"

#   export RUSTUP_TOOLCHAIN=nightly
#   cargo test --frozen --all-features
# }

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/mirrord

  install -Dm644 mirrord.bash "$pkgdir/usr/share/bash-completion/completions/mirrord"
  install -Dm644 mirrord.fish "$pkgdir/usr/share/fish/vendor_completions.d/mirrord.fish"
  install -Dm644 mirrord.zsh "$pkgdir/usr/share/zsh/site-functions/_mirrord"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

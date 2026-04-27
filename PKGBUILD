# Maintainer: Drew Carlson <its@drews.website>

pkgname=bwx-cli
pkgver=2.3.0
pkgrel=1
pkgdesc="Unofficial Bitwarden CLI with first-class macOS support (renamed fork of rbw)"
arch=('x86_64' 'aarch64')
url="https://github.com/drewcarlson/bwx-cli"
license=('MIT')
depends=('pinentry')
makedepends=('cargo')
provides=('bwx')
conflicts=('bwx-cli-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace `SKIP` with the real sha256 once the tag is pushed.
# Compute via:  curl -L $source | sha256sum
sha256sums=('0f85ae6d31675bbab84231e03979560b6fc9c0b84dca2ae91be9a0a1a7cddf75')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  install -d target/release/completion
  ./target/release/bwx gen-completions bash > target/release/completion/bash
  ./target/release/bwx gen-completions zsh  > target/release/completion/zsh
  ./target/release/bwx gen-completions fish > target/release/completion/fish
}

check() {
  cd "$pkgname-$pkgver"
  # Skip the e2e/`#[ignore]` suite (it spawns vaultwarden); keep the
  # unit + lib tests for packagers to catch regressions.
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/bwx       "$pkgdir/usr/bin/bwx"
  install -Dm755 target/release/bwx-agent "$pkgdir/usr/bin/bwx-agent"
  install -Dm644 target/release/completion/bash \
    "$pkgdir/usr/share/bash-completion/completions/bwx"
  install -Dm644 target/release/completion/zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_bwx"
  install -Dm644 target/release/completion/fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/bwx.fish"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

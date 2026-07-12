# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccr-resume
_pkgname=ccr
pkgver=0.2.6
pkgrel=1
# AUR base "ccr" is the unrelated netCDF Community Codec Repository (ships no
# /usr/bin/ccr), hence this pkgname; the binary keeps upstream's name.
pkgdesc="CLI Code Resume - TUI session picker across Claude Code, Codex, and Gemini CLI"
arch=('x86_64')
url="https://github.com/brevity1swos/ccr"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4570eb9f976d2815c99669045eb75edfda8db4aa2c76cdbe4e36f6ab3ca67e1')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/ccr" "$pkgdir/usr/bin/ccr"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

latestver() {
  gh api --paginate repos/brevity1swos/ccr/tags --jq '.[].name' |
      sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

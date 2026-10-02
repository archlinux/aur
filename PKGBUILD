# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-tui
_srcname=katana-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial terminal client for Nonograms Katana user puzzles"
arch=('x86_64' 'aarch64')
url="https://github.com/ArkadyBuryakov/katana-desktop"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')  # makepkg's C LTO flags break ring's objects at link time
source=("$_srcname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('925f1d70885cded79dd8a381003b78e0181d3015cacaf274e11a93deabdf76e2')
_features=(--no-default-features --features tui)  # the terminal frontend alone: no webview

prepare() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release "${_features[@]}" --bin katana-tui
}

check() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release "${_features[@]}"
}

package() {
  cd "$_srcname-$pkgver"
  install -Dm755 target/release/katana-tui -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

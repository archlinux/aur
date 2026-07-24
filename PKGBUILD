# Maintainer: atp atp@disroot.org

pkgname=harvcode
pkgver=0.5.3
pkgrel=1
pkgdesc="A fast Rust tool for harvesting source files as Markdown and copying them to the clipboard"
arch=('x86_64')
url="https://github.com/atp-gh/harvcode"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=(
  'wl-clipboard: clipboard support under Wayland'
  'xclip: clipboard support under X11'
  'skim: interactive file selection using sk'
  'fzf: interactive file selection using fzf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ecc8f6756f92e9b28c36110afef66e7f47365fc8c37114906687c1f1c332faa')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}

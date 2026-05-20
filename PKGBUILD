# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=basalt
pkgver=0.12.5
pkgrel=1
pkgdesc='A TUI Application to manage Obsidian notes'
url='https://github.com/erikjuhani/basalt'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
source=("$url/archive/refs/tags/basalt/v$pkgver.tar.gz")
sha256sums=('8438ebb628bfae283172d7ca450567ca49e44dcd1825d4843d40173f77d39927')
_srcdir="$pkgname-$pkgname-v$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export BASALT_VERSION="$pkgver"
  export BASALT_COMMIT_SHORT_HASH="5329099"
  export BASALT_COMMIT_DATE="2026-05-17"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --workspace --frozen --all-features
}

package() {
  cd "$_srcdir"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

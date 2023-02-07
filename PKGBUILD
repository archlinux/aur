# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-wapm
pkgver=0.2.1
pkgrel=1
pkgdesc="Cargo sub-command for publishing Rust crates to the WebAssembly Package Manager"
url="https://github.com/Michael-F-Bryan/cargo-wapm"
license=('Apache')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Michael-F-Bryan/cargo-wapm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d1d17d8c0eb3cff25cab7769c6f37cc73d47c3495ad743f4fb3c8b1fd370a83')
b2sums=('3ee081e894ae58451306944074a00ea5d1b4435441dcd53848598954460e47ede03800af68581861fb014a6f628a6e8ac352f1f65f945f3159f232e4b05e2f78')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$_target"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-wapm

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=canoe
pkgver=0.5.0
pkgrel=1
pkgdesc="Stacking window manager for River inspired by Windows 3.x"
arch=('x86_64')
url="https://github.com/roblillack/canoe"
license=('MIT')
depends=('river' 'freetype2' 'libgcc' 'libxkbcommon' 'glibc' 'fontconfig')
makedepends=('cargo-nightly')
install=canoe.install
source=(
  canoe-$pkgver::https://github.com/roblillack/canoe/archive/refs/tags/v"$pkgver".tar.gz
)
sha256sums=('0fce7ff6638b82cb2a21a2ace92bc0078debd06bf7c3a07fdfc22d3089ae75e5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}
check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  install -Dm0744 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-wapm
pkgver=0.3.6
pkgrel=1
pkgdesc="Cargo sub-command for publishing Rust crates to the WebAssembly Package Manager"
url="https://github.com/Michael-F-Bryan/cargo-wapm"
license=('Apache')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Michael-F-Bryan/cargo-wapm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('502dc130d9de90cc38b02339604a515c5c5e400758c21854b8b207ae06ac5e0f')
b2sums=('5c1e17f7fc6d04023daeef828efb1c11dccf3faa71b4c8255274000e813f5479d4fee9f991cf7080089502e5ccdd06d827a551c17734d9c2da9eb67554937223')

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

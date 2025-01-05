# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=dcmfx
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI and libraries for working with DICOM'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e45bffce6fc6461c51f27b36d6a52fddae405994d9f6b00d2b11d01b3739c4a3')
makedepends=('cargo' 'cmake')
depends=('zlib' 'gcc-libs' 'glibc')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver/src/rust"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver/src/rust"
  cargo build --release --frozen --bin dcmfx_cli
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver/src/rust"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver/src/rust"
  install -Dm755 "target/release/dcmfx_cli" "$pkgdir/usr/bin/dcmfx"
}

# vim: ts=2 sw=2 et:

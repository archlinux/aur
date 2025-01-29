# Maintainer: DCMfx <https://dcmfx.github.io>

pkgname=dcmfx
pkgver=0.7.0
pkgrel=1
pkgdesc='CLI tool for working with DICOM and DICOM JSON'
arch=('x86_64' 'aarch64')
url="https://dcmfx.github.io"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dcmfx/dcmfx/archive/v$pkgver.tar.gz")
sha256sums=('7f9c323672c52ffd7cc3b6b0d8e6ff33c63ee576528e7b4c2e6031483a18efee')
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

# Maintainer: DCMfx <https://dcmfx.github.io>

pkgname=dcmfx
pkgver=0.20.0
pkgrel=1
pkgdesc='CLI tool for working with DICOM and DICOM JSON'
arch=('x86_64' 'aarch64')
url="https://dcmfx.github.io"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dcmfx/dcmfx/archive/v$pkgver.tar.gz")
sha256sums=('2cd13b37649be2f17ca5a8ce851c9330370e9f852dba925a83b927d8e36400c2')
makedepends=('cargo' 'clang' 'cmake' 'nasm')
depends=('gcc-libs' 'glibc' 'x264' 'x265')
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

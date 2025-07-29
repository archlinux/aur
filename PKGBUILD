# Maintainer: DCMfx <https://dcmfx.github.io>

pkgname=dcmfx
pkgver=0.30.1
pkgrel=1
pkgdesc='CLI tool for working with DICOM and DICOM JSON'
arch=('x86_64' 'aarch64')
url="https://dcmfx.github.io"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dcmfx/dcmfx/archive/v$pkgver.tar.gz")
sha256sums=('a6d320bc6666c3b534919b1090f217de1aa17890b3241f498b7e7eea5e8492e8')
makedepends=('cargo' 'clang' 'cmake' 'nasm')
depends=('ffmpeg' 'gcc-libs' 'glibc')
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

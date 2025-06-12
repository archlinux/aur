# Maintainer: DCMfx <https://dcmfx.github.io>

pkgname=dcmfx
pkgver=0.22.1
pkgrel=1
pkgdesc='CLI tool for working with DICOM and DICOM JSON'
arch=('x86_64' 'aarch64')
url="https://dcmfx.github.io"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dcmfx/dcmfx/archive/v$pkgver.tar.gz")
sha256sums=('c65224df5999b88d9b34a0787a18bbbf6796340e7924d0f34936d43ea6a920ad')
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

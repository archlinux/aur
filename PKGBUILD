# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=dcmfx
pkgver=0.6.0
pkgrel=1
pkgdesc='CLI and libraries for working with DICOM'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0e84f1a503accc802d715a35244326312c3f3b0633af2606f1b06db70c81d56c')
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

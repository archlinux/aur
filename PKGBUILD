# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-rs
pkgver=0.10.0
pkgrel=1
pkgdesc="Automate the installation and update of Linux Gaming Compatibility tools"
arch=('x86_64')
url="https://github.com/auyer/Protonup-rs"
license=('Apache-2.0')
depends=(
  'glibc'
  'xz'
)
makedepends=('cargo')
source=("Protonup-rs-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d933627875bcf80b07d1aa1a1d2e6ec9a6df66ee45af499946afcd2c5ab0b9a7')

prepare() {
  cd "Protonup-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "Protonup-rs-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Protonup-rs-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

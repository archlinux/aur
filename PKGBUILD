# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lib32-libvolt
pkgver=2.4.2
pkgrel=1
pkgdesc="32-bit library for volt-gui"
arch=('x86_64')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-only')
depends=(
  "volt-gui=$pkgver"
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-vulkan-icd-loader'
)
makedepends=(
  'cargo'
  'lib32-rust-libs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e95cf5aad01a2290080946d5e609326a4f54ea5af8ff616561400c8d1acb585a')

prepare() {
  cd "volt-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  cd "volt-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS+=" -C link-args=-m32"
  cargo build --frozen --release --lib --target i686-unknown-linux-gnu
}

package() {
  cd "volt-gui-$pkgver"
  install -Dm755 target/i686-unknown-linux-gnu/release/libvolt.so -t \
    "$pkgdir/usr/lib32/"
}

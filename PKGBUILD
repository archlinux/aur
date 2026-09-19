# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lib32-libvolt
pkgver=2.4.0
pkgrel=1
pkgdesc="32-bit library for volt-gui"
arch=('x86_64')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-or-later')
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
sha256sums=('c8fec0a63eec8e75c3e42518c16d3b4379ae80a6c5067ce3ca4da20cbfb0e000')

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

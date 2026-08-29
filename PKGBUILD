# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=lib32-libvolt
pkgver=2.1.0
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
makedepends=('rustup')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f885867e062ce85d77c91f79404799f38aecc94a877877c406874e413edad62c')

prepare() {
  cd "volt-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add i686-unknown-linux-gnu
  # cargo fetch --locked --target i686-unknown-linux-gnu
  cargo fetch --target i686-unknown-linux-gnu
}

build() {
  cd "volt-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"
  # cargo build --frozen --release --lib --target i686-unknown-linux-gnu
  cargo build --release --lib --target i686-unknown-linux-gnu
}

package() {
  cd "volt-gui-$pkgver"
  install -Dm755 target/i686-unknown-linux-gnu/release/libvolt.so \
    "$pkgdir/usr/lib32/libvolt.so"
}

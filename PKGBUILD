# Maintainer: SlobCoder <slobcoder at slobcompany dot com>

pkgname=nautilus-checksums-rust
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast SIMD/ASM-accelerated Nautilus 4 extension for computing file checksums"
arch=('x86_64' 'aarch64')
url="https://github.com/SlobCoder/nautilus-checksums-rust"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libnautilus-extension'
  'openssl'
)
makedepends=('cargo')
provides=('nautilus-checksums')
conflicts=('nautilus-checksums')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5ca20aa500317d3d39c2ea422ff785b5d056fbe0569fa9a3f8263cd7c6a7a339c0bf3d75cd8213902fba2ea04e33c192a1f208db3e3cf824d6869f5a4c0f7af3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --lib
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  local extdir
  extdir="$(pkg-config --variable=extensiondir libnautilus-extension-4)"
  install -Dm0755 "target/release/libnautilus_checksums.so" \
    "$pkgdir${extdir}/libnautilus-checksums.so"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

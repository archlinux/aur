# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ente-cli
pkgver=0.4.4
pkgrel=1
pkgdesc="A Command Line Utility for exporting data from Ente."
arch=('x86_64' 'aarch64')
url="https://ente.com"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'glibc'
  'libgcc'
  'openssl'
  'sqlcipher'
  'sqlite'
)
makedepends=('cargo')
source=("https://github.com/ente/ente/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('45b2ecb49c6b73099ba42814b7bbe72181d20d2eb11d1cd8a3531b8a93452e7a')

prepare(){
  cd "ente-$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path rust/Cargo.toml --locked --target host-tuple
}

build() {
  cd "ente-$pkgname-v$pkgver/rust"
  CFLAGS+=" -ffat-lto-objects"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export OPENSSL_NO_VENDOR=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --frozen --release -p "$pkgname" --bin ente
}

package() {
  cd "ente-$pkgname-v$pkgver"
  install -Dm755 rust/target/release/ente -t "$pkgdir/usr/bin/"
}

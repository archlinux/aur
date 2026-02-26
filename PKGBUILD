# Maintainer: David Kaya <david@kaya.sk>
pkgname=ttyms
pkgver=0.1.0
pkgrel=1
pkgdesc="A secure terminal client for Microsoft Teams"
arch=('x86_64' 'aarch64')
url="https://github.com/davidkaya/ttyms"
license=('MIT')
depends=('gcc-libs' 'openssl' 'dbus' 'libsecret')
makedepends=('rust' 'cargo' 'pkg-config')
conflicts=('ttyms-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/ttyms" "$pkgdir/usr/bin/ttyms"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ttyms/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/ttyms/README.md"
}

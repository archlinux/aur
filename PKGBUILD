# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri
pkgver=0.4.1
pkgrel=1
pkgdesc="A minimal AUR helper written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git' 'sudo' 'util-linux')
makedepends=('cargo' 'rust')
options=('!lto')  # ring's C code must not be built as GCC LTO objects
source=("$pkgname-$pkgver.tar.gz::https://github.com/ognrdrch/rauri/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1b0f2169b117ceaeec40acc9ac0490e5115f923190f578a7a76c5f86492a266')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rauri "$pkgdir/usr/bin/rauri"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

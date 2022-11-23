# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=gitoxide
pkgver=0.19.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/gitoxide"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends=('openssl')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Byron/gitoxide/archive/refs/tags/v$pkgver.tar.gz")
cksums=('2244076510')
sha256sums=('da306eb250abc7152f39a7f148a7655b2d99beaf8a756a526ec93b973529f9a9')
b2sums=('2db6ed7c20b2b7ed328a2b7a7247bb216a9ed5310801c6ac6124e0326c026425a757dca9fc8d9535c331c4672adfe532bf2a06c8af1928ee4fc2e02a7e0be7d4')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  OPENSSL_NO_VENDOR=1 \
  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'max'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/gix target/release/ein

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}

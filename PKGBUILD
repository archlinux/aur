# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.6.0
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6a7dbaddd39172927170d5d0b7aec12c7b72531d8961963e6059dd432555488')
b2sums=('630f3481a4f6d079d6a22e662f8849ad110f5c79f27e2c2f67db47ed2044cfe90aa746a7b7552a8f507824e70f1a89c24e7b91042504477004dd8f39914f7124')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  export LIBGIT2_NO_VENDOR=1

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/convco

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

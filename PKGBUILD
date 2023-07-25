# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.4.1
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbee100a10db98adfa2a0913583136d91ceec915a0c7758ec22f1072419fa541')
b2sums=('cf35d98c6fa5ce12eb2c977364027a4b8a7cc5e9ebf2066533dfc7c61c275c8d826a582493e29af74ce8cd141f8bbb9c82f1ab46ecf6f66f9c3bcad5c382ce32')

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

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/convco

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

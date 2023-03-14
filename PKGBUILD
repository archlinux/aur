# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nurl
pkgver=0.3.9
pkgrel=1
pkgdesc='Generate Nix fetcher calls from repository URLs'
url='https://github.com/nix-community/nurl'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7906da54811e1ea502d8687932977dde01d685ce96d95e7775f258d05696587')
b2sums=('af5cb1cc5f87d3d0546325e7e61a9c237aba52c7f23ee3286ab48465c3f8f0a98199f1bcc6cd26a37e9d02b5b37b27512f65e9283743d4bf1b47941e37fb96f7')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

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
    target/release/nurl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

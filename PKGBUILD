# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.4.0
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88c92b175163c8847da7dd201d32106c51ff85e2c992c2a3ff67e29ecbe57abb')
b2sums=('04a6d1610651b7fd397ef72b850e07e59eee7e5f27086c817f88b4d8be69e0abf583fba43fce0281fdd8990bbda3c1a75b877017867241a7d3311d7939114781')

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
    target/release/convco

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

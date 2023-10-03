# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.4.3
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e5253e5968f364f86d2f1cfb24c95a68890bf620886c644c7df981b803bb808')
b2sums=('b493df913eb2a058bde5a1950c52117fa9ff76d8bc6188d674de480bc320291b3381b148706ed05a526fb9c1a7e00d7c98edaeba7ca325e07958161c20066f8e')

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

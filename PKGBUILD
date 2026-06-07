# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nurl
pkgver=0.4.0
pkgrel=1
pkgdesc='Generate Nix fetcher calls from repository URLs'
url='https://github.com/nix-community/nurl'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecd34bdb9f7c481b5a0138a816dd3350d579bbe18f560fb9221d4f6537432693')
b2sums=('7e621f24fbd78277170c083c888b3985e597f0308d9363232d34c09b4df23543ee7f2cea36badac0260d4a46859d8f0c1a510655ba6d1d2400ebb00adb347fc6')
options=(!lto)

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

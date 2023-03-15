# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nurl
pkgver=0.3.10
pkgrel=1
pkgdesc='Generate Nix fetcher calls from repository URLs'
url='https://github.com/nix-community/nurl'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89845457a71557ba0f76209605536eb2f23317bf99567e36f28d2716ecf8dc9c')
b2sums=('af3a2b43cc4b6f3230053dd318ee9713c38322ab22265513f9cbf8bd23b650866f2acb1b2652eb8d292c01e3473e1425a3ae7b8e7355fc6aeb623f955375f1f3')

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

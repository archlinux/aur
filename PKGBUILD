# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nurl
pkgver=0.3.12
pkgrel=1
pkgdesc='Generate Nix fetcher calls from repository URLs'
url='https://github.com/nix-community/nurl'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acc0734b3deb136a1f4c663360c144d7a35e44eb2aa00fb0d39cb380227e7415')
b2sums=('ad64c4d6d9797ed50d7972a318de11c0ccfd1f33eb6f5400763883d23c3b92abbd72d5c10cab838b5b096609d66e3d1e1bccafa4d4ca454d84c7ef5e6febd43b')

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

# check() {
#   cd "$pkgname-$pkgver"
#
#   cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/nurl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

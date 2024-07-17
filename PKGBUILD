# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nurl
pkgver=0.3.13
pkgrel=1
pkgdesc='Generate Nix fetcher calls from repository URLs'
url='https://github.com/nix-community/nurl'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('638e8dc6b1146b041fd3631497a82aa223fc2c4ce5f2e2d7abe8d390e711111d')
b2sums=('ca5324d61b33b8a59a18f1ac268754284f437e5828eb8c2758692aa70d42f4780fb3af8d2d91271fb9c7441f4a6c55faa993cc1e0494a2259e6384ee500982ee')
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

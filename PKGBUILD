# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-init
pkgver=0.2.2
pkgrel=1
pkgdesc='Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more'
url='https://github.com/nix-community/nix-init'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'curl' 'bzip2' 'zlib' 'nurl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "https://github.com/nix-community/nix-init/raw/f839a45b97f2130b55e97652dce9c82d00d2772d/LICENSE")
sha256sums=('c021588c1b7aed29996e17e68c0f3637229eba6d1ebfad82b324594123662773'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
b2sums=('01a19a01640153ac356f255b2b12129532e18dff8c3edf05a53bfc5d650a35350f14d6832feb72cadf62b31c4ad1b69867b04488271635b07fb02785de6a5d46'
        '385ec46b62788d2cfed32d1de03728fdf3f36f1b90f726e2412969918ddd2c1859b26b722bd5b3806252620409550da6b9cbc8ab8583c1cb140b3043e8606f8c')

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
    cargo build --frozen --release --no-default-features --features 'reqwest/rustls-tls'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/nix-init

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}

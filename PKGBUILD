# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-init
pkgver=0.2.0
pkgrel=2
pkgdesc='Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more'
url='https://github.com/nix-community/nix-init'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'curl' 'bzip2' 'zlib' 'nurl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "https://github.com/nix-community/nix-init/raw/f839a45b97f2130b55e97652dce9c82d00d2772d/LICENSE")
sha256sums=('923e7df055f5c63f1f58b584af885339e742af09fe9d5e33119c18b610db1715'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
b2sums=('4fc4c3d3d22bd0c7890a3d0e013ce8a340ee9e85f3fb053f755d74fac5012bb293bb9d08357b7423822919644bb3efb5a4730ebc8eb207056ccc7a6992562eaa'
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

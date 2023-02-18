# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.2.3
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('78f362d45e614bae09f7a9acb0a1fc91cd8ccec32b2946a48eac90a3ea3a071f'
            '701b1620c34919b15eb7283d5a34e00f4802c8000a134fdc625a644bac85f36a')
b2sums=('0ef75c79cf6040b0aaa9ef6b8c67c4d2d52b0820e92dcc53205b6952be6f070a3df7bcf055af86901d5ed1045f930f4d7a1241ee966c3d74e7ee8986f44a67a2'
        'a3e9c6b13c42f2da3cb2bb3e9eb95e2cb5cc2824c5a8b90a3b993089e6e38a92baeeb2d5e68fef4e35024ddf5f9bbbb81ca295bd2acd713c12bc9069cb89fc26')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  ln -sf "$srcdir/Cargo.lock" bkmr/Cargo.lock

  cargo fetch --manifest-path bkmr/Cargo.toml --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --manifest-path bkmr/Cargo.toml --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/bkmr

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

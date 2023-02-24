# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.3.0
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('44ebc9143f5ca8114e8d0bec07af042cea3056ba5aef1b03192359fce2af2d90'
            '339d2f42a1c11fd85a56569b232889b374066c9cdf7ba66b5094ada37e4e1eb0')
b2sums=('09c0deea7594a8f9419097c4659429f2f6eab17aafdf3f9b2ed6249639a77bbb9eac85272b61c1745869313bdac60e0bd801141c741e0b4d4d0fce96ee77d9b6'
        '52fff319d3525897686b844c9a107e994f905b3a587bd6fa9e550e8f6e7688c2fcd1725d534837cd13cd5bbf9e87fb7ae0fc60a988f995db35ddb66ab7cc1c2d')

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

# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=goku
pkgver=1.1.4
pkgrel=1
pkgdesc='HTTP load testing application'
url='https://github.com/jcaromiq/goku'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcaromiq/goku/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f09dd49d2e37dd0db9c184067fc198a5e109770d9e6ee53c99a39f5690e41fe6')
b2sums=('0aa847d0e545dee3d8e67e6d2f6de37507296d8de027aa33af4800f70673c132987bba9db8c0607131586cc8d103389b1e1a17073052554a0dc607ddc4a42381')
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
    target/release/goku

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

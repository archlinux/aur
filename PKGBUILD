# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=autokernel
pkgver=2.0.1
pkgrel=2
pkgdesc='A tool for managing your kernel configuration that guarantees semantic correctness'
url='https://github.com/oddlama/autokernel'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oddlama/autokernel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('437b7fa58a36e493f3264e3d37ee7e1db5689946af3fe32c4bbbe184907842b4')
b2sums=('b4a99f29ddd5934ab875f307c81891214f59bd86242d3f92212d98cca8e3397648d69204ace88bf39785cfbf1ab99d743e154c26fe46f660d04ab4cc74b9150c')

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
    cargo build --frozen --release --features 'index'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/autokernel{,-index}

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

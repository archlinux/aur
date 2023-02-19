# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=orz
pkgver=1.6.2
pkgrel=1
pkgdesc='A high performance, general purpose data compressor'
url='https://github.com/richox/orz'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/richox/orz/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff9f8d77084f0510cfb4966be7cf02a00c4a17715879dfdb85eaa1380023a7c7')
b2sums=('ec85794b1d835d055b2e146746ae2c4534fedc222f12db50c0025f668f4d261b69bb0aefe39b83c225d60d69e42a82ea77d21764cf82585b7f8f0212d040435e')

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
    target/release/orz

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

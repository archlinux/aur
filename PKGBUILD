# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=goku
pkgver=1.0.1
pkgrel=1
pkgdesc='HTTP load testing application'
url='https://github.com/jcaromiq/goku'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcaromiq/goku/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7ada3e9f41ff2397a36cf377b607fcc77be06ed84a2ed6b37a114121c2e29328')
b2sums=('f719b93adfe6bf21d68e7d6ab58d1c8d89f45eea1adc41621a1df1779bee613972230dbc116f7421712cbb33608778f5e38eb65e08a8bfffac64a7eaf13038be')

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

# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=goku
pkgver=1.1.7
pkgrel=1
pkgdesc='HTTP load testing application'
url='https://github.com/jcaromiq/goku'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcaromiq/goku/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('799e155c93937ccba830670fa25890d5fe53ceb01737926914d480ce0c39c752')
b2sums=('bc818336981e6609edba1a45c8e54cb11ba96c7bba9fcad3eab08174010c10d6df6b893bd758e5c84092212403926a2008b6e3350e5d17bab465c803c7c05920')
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

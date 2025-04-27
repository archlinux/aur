# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=goku
pkgver=2.0.0
pkgrel=1
pkgdesc='HTTP load testing application'
url='https://github.com/jcaromiq/goku'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcaromiq/goku/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52a95fa94b808d2c93bc875d78278abc2d9bb9da373d6782f0d4e08394eb6c99')
b2sums=('e7ab2e9ac79cf5c6fc9eb08326a0d1744271024921e1f234bdeed795025e5233ca039e7924d7c4fd7a0ddf657f2a76c8c6fc7615d3de0eaca08c3cd6664c4064')
options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tongo
pkgver=0.15.5
pkgrel=1
pkgdesc="A TUI for MongoDB"
arch=('x86_64')
url="https://github.com/drewzemke/tongo"
license=('GPL-3.0-only')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7cd622e334fbe21f27c2e2d326bea830326deb9ef7c9c000f5d1b59050057234')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

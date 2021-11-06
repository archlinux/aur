# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall
pkgver=0.4.1
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('zlib' 'openssl' 'xz' 'bzip2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-tests.patch::$url/commit/4b38814f8051e4c2f45fe465c8dfbfc338e4375a.patch")
sha256sums=('6692486436f5c0d9eddc7f1c48baf364be78cc2eaec27126dde4d3624961251a'
            '6343be5f8f5d3a8264d2b02787b2107a395c5f6222cd8f06b08e9f81e2d2732c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
  patch -Np1 < "../$pkgname-tests.patch"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

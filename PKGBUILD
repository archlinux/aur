# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-docs-rs
pkgver=0.1.11
pkgrel=1
pkgdesc="Imitate the documentation build that docs.rs would do"
arch=('x86_64')
url="https://github.com/dtolnay/cargo-docs-rs"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('2da8897ae87a2094679c2f77186389d385f7a2b829c40ea5e02297a9ccfe245120821ff8451959484b112c08aa88c8c7de389eceb441681c81d5198b03a6fea6'
            '13dbaff9a70809e042d6a93b0b828f6ec8e63ce004b1d00c90bd4e15e8f1b604c19e6b80d6ec12099e14161becd1cd7742805a5818a742c32f4abeb2c08f7a56')

prepare() {
  cd "$pkgname-$pkgver"
  cp "$srcdir/Cargo.lock" .
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

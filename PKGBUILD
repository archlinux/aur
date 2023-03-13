# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=codevis
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool for turning your code into one large image"
arch=('x86_64')
url="https://github.com/sloganking/codevis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/1040b13aa03836678ec4ac5660994708ca559518.patch")
sha512sums=('789a8b7102ae5bcf1fba7b87de93496e2771ea3aebfb2a64de3e9e85525d4709890988867c2b80c026fbd7e5d81557ef937e48e1df7f1438eb70d7cbb02f0dd2'
            '75ead7523ae0731f008b24eeec051adf48f48f97ad674be4d8eabc2e7f3eeb540bf45520f9a8c076fcc53b71e63d6b4a841c32b0b6451d1931da12a4c093fd73')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../$pkgname-$pkgver-cargo-lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

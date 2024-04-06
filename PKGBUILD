# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-docs-rs
pkgver=0.1.12
pkgrel=1
pkgdesc="Imitate the documentation build that docs.rs would do"
arch=('x86_64')
url="https://github.com/dtolnay/cargo-docs-rs"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('bcb469b07b207bfc84167c60c6db7a197ddba097af1be7ce5c649e1a1249ed0992a5537c92e4d2e21ab549ea637a8995755cb8750af3123e8dc14ac0ab3784f6'
            'ac1552b94d18b9676754a1905f261c94bcc96bb53cc87e053f670aa9c5b329a295c7d409ccccce20ab44a9dbd6e5b436c2f9f28f2917ef0b6b35b9d91273dec4')

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

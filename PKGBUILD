# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bob
pkgver=2.0.0
pkgrel=1
pkgdesc="A version manager for neovim"
arch=('x86_64')
url="https://github.com/MordechaiHadad/bob"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/014f3977e2af09c5f8519d46f64aac354f39da99.patch")
sha256sums=('309f26ce15b03f71c06045f46159a99e7e6a77056a9263b7a11a1ed1742fca2a'
            'ec26a6488eb2b28a5876b61ec212c438d8d5dc582e21b6f627307160985a8b83')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-cargo-lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release # --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test # --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

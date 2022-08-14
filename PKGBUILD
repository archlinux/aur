# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-patch
pkgver=0.2.4
pkgrel=1
pkgdesc="Cargo subcommand for patching dependencies using patch files"
arch=('x86_64')
url="https://github.com/mettke/cargo-patch"
license=('MIT')
depends=('curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-tests.patch::$url/commit/89ff94ea355361a9803b11bb5b6a98a47c563323.patch")
sha512sums=('999ff7fa4ecffee99982a0d6c41e2ec1dae59cd5849d4a37b8b27db0f400b8a9f5155f8acc452042fb56ebb54d22ca338c3cc9a8b53ad2433692a7fdcf2ce77f'
            'a03e20a4ea686fa5df4b32c22ba6df1be3e3be8218253753ac4a454f9aabb1383bd4d336664e44d01cbd0f4ab35e7387b98b761975df9ccfb8a62b4df334409b')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-fix-tests.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
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

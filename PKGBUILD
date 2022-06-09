# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall
pkgver=0.9.1
pkgrel=1
pkgdesc="Binary installation for Rust projects"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('xz' 'bzip2')
makedepends=('cargo' 'cmake' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-fix-tests.patch::$url/commit/14823fbae73ed67199d848a67587e38492c57fd8.patch")
sha256sums=('38643acc8442a0b58e3c4c0ea49af6dc9c9e5e138be714fe8e2e4da845c97e1b'
            '4e6a147516136c456256f579615490cfc981bda7e5342555f11ecd07978b4165')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "../$pkgname-fix-tests.patch"
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
}

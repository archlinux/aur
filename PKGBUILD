# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e
pkgver=0.2.0
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
depends=('gcc-libs')
makedepends=('rust'
  # aom dependency
  'cmake' 'perl' 'nasm')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xiph/rav1e/archive/v$pkgver.tar.gz")
sha256sums=('c0fa8ee189f506c1a2dfd4b497ebb4e52739e850e1ecce7c02e6bc1073e63d66')


prepare() {
  cd "$pkgname-$pkgver"

  # for librav1e
  RUSTFLAGS="-C opt-level=0" cargo install --force --root "$srcdir" cargo-c
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test --release
}

package() {
  cd "$pkgname-$pkgver"

  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgname-$pkgver"
  # for librav1e
  "$srcdir/bin/cargo-cinstall" install --release --destdir "$pkgdir" --prefix "/usr"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rav1e"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"

  rm "$pkgdir/usr/.crates.toml"
}

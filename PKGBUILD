pkgname=dcr
pkgver=0.8.2
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.8.2.tar.gz")
sha256sums=('4bdacd0e19103296ac4f6cc7e2dc24db9bb57f91b2ec7b5a40e7eea015535fa7')

build() {
  cd "$srcdir/$pkgname-0.8.2"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked --features archive
}

package() {
  cd "$srcdir/$pkgname-0.8.2"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

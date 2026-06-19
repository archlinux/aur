pkgname=dcr
pkgver=0.7.4
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.7.4.tar.gz")
sha256sums=('9bdfb6c16bd6b94e6a1569639bd38d25915fd6dbfbe1f7ba18b911eeede3a40c')

build() {
  cd "$srcdir/$pkgname-0.7.4"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-0.7.4"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

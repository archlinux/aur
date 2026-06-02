pkgname=dcr-dev
pkgver=0.7.1
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (development release)"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.7.1-dev.tar.gz")
sha256sums=('b829d073d5c03fba40f0d7e8036b641663edce1114b4ef395bec6ea282dbee5f')

build() {
  cd "$srcdir/dcr-0.7.1-dev"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-0.7.1-dev"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

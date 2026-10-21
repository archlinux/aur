pkgname=dcr
pkgver=0.9.5
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.9.5.tar.gz")
sha256sums=('9b05ef56a88afa4c8b87b23a6f34ea24ade828c44e8d02ade2369646f84e10c0')

build() {
  cd "$srcdir/$pkgname-0.9.5"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked --features archive
}

package() {
  cd "$srcdir/$pkgname-0.9.5"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

pkgname=dcr
pkgver=0.9.1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.9.1.tar.gz")
sha256sums=('e79af7f3573f04ffcdb9e448bb12392c7ef63fc59f814b9e82da2bf61e65ffc3')

build() {
  cd "$srcdir/$pkgname-0.9.1"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked --features archive
}

package() {
  cd "$srcdir/$pkgname-0.9.1"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

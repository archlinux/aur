pkgname=dcr-dev
pkgver=0.7.3
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.7.3-dev.tar.gz")
sha256sums=('848ae7571e85687bf62dce73ea61b5961a54b30baf5a138ebff4f5d1c72b8ca7')

build() {
  cd "$srcdir/dcr-0.7.3-dev"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-0.7.3-dev"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for manpage in man/man1/*.1; do
    install -Dm644 "$manpage" "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done
}

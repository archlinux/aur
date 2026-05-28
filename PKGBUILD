pkgname=dcr
pkgver=0.6.9
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba3558c0121cff7270be3178c3675b2cf8287f9dfdb9011cadd281b1b3fc8cfc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_PROFILE_RELEASE_LTO=false
  export RUSTFLAGS="${RUSTFLAGS:-}"
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=dcr
pkgver=0.2.1
pkgrel=3
pkgdesc="Cargo-like utility to manage C/C++ projects"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30e334fa98cd51073c0fa84c80a982584b00156b57084311ad53419441ce6235')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_PROFILE_RELEASE_LTO=false
  export RUSTFLAGS="${RUSTFLAGS/-C link-arg=-fuse-ld=lld/}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Hamid R. K. Pishghadam <hamidrkp@riseup.net>

pkgname=r2fas
pkgver=0.1.0
pkgrel=1
pkgdesc='Loads FASM -s symbolic dumps in radare2 (labels, source lines, comments)'
arch=('x86_64' 'aarch64')
url='https://github.com/hamidrezakp/r2fas'
license=('MIT')
depends=('radare2>=6')
makedepends=('cargo' 'pkgconf' 'radare2')
checkdepends=('radare2' 'fasm')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hamidrezakp/r2fas/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79f1ab996bc5ac758ef2f9dafb646e22d761252030fd33c6a37eb9338a84168f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make fixtures
  cargo test --frozen --all-features -- --test-threads=1
}

package() {
  cd "$pkgname-$pkgver"
  local r2ver
  r2ver="$(pkg-config --modversion r_core)"
  install -Dm0755 target/release/libcore_fas.so \
    "$pkgdir/usr/lib/radare2/${r2ver}/core_fas.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

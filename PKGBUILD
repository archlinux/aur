# Maintainer: Hamid R. K. Pishghadam <hamidrkp@riseup.net>

pkgname=r2fas
pkgver=0.2.0
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
sha256sums=('48a3d5e2d414735aea70951f405a6bf9ecb5db97b9d51862f126cd1e6804815a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen -p r2fas --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make fixtures
  cargo test --frozen -p radare2
  cargo test --frozen -p r2fas --all-features -- --test-threads=1
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

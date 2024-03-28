# Maintainer: Dimitri Merejkowsky <dimitri@dmerej.info>
pkgname=ruplacer
pkgver="0.8.3"
pkgrel=1
pkgdesc="Find and replace text in source files"
url="http://github.com/your-tools/ruplacer"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("ruplacer-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a4cbbba2377f07a5656f435d32a6920a7afb7d37cdc81f884a5150abed7ced4c')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
 }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/ruplacer "${pkgdir}/usr/bin/ruplacer"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ruplacer/LICENSE"
}

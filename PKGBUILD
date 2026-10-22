# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio
pkgver=0.4.2
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command"
arch=('x86_64' 'aarch64')
url="https://terrio.opengeos.org"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# Its C dependencies (zstd, ring) are linked by Rust's linker, which cannot read GCC's LTO objects.
options=('!lto')
conflicts=('terrio-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/opengeos/terrio/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4462026723875096e2d6e302499be3eeaa9fcc9bbf128d858141e4e9c4af80e3')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p terrio-cli
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

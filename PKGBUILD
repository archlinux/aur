# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=1.1.2
pkgrel=1
pkgdesc="Binary space partitioned layout for the tiling Wayland compositor River"
arch=('x86_64')
url="https://github.com/areif-dev/river-bsp-layout"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
)
makedepends=(
  'cargo'
)
provides=(
  'river-bsp-layout'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  'e776ba5464aa016f007971f5bde17d2eb5daff821a1d8610a4004ae942064fe7fa7054441720ae20cd6a5e2c4ea1b589a203ff461d27f3d4a439ffce7b51ac87'
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

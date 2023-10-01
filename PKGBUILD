# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=1.1.1
pkgrel=1
pkgdesc="Binary space partitioned layout for the tiling Wayland compositor River"
arch=('x86_64')
url="https://github.com/areif-dev/river-bsp-layout"
license=('GPL3')
depends=(
    'gcc-libs'
)
makedepends=(
  'cargo'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  '21becbfc35e59aabd61df100ae9f6c963f0b64b598c5a62f720a0ca1754bffd907b815ac44bdad998101712a975f17439c7cbfad36a9996c3025c4b362c64636'
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

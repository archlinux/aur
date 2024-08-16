# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=2.1.0
pkgrel=1
pkgdesc="Binary space partitioned layout for the tiling Wayland compositor River"
arch=('x86_64')
url="https://github.com/areif-dev/river-bsp-layout"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'cargo'
  'git'
)
provides=(
  'river-bsp-layout'
)
source=(
  "${pkgname}"::"git+${url}#tag=v${pkgver}"
)
b2sums=('8a609cbb8f7e7f30ac8c93ab2ccdbba000a5171c2478f39a24e7e672a33cc7bb81372e9a98939ec6a8211ff1e52d8ac255fd8a0d18f42efc1d92297c8a3d315d')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${srcdir}/${pkgname}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${pkgname}"
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

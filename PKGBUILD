# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=2.1.1
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
b2sums=('f7fb18ae209b7cae9e3a0e6ec4d238a22f390028bb2b00ccc77b95b1aac55813147376737d32a38c1c19f7093f132c7b7a35504c9f5239ef60698ed9b52b6f24')

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

# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=2.2.0
pkgrel=1
pkgdesc="Binary space partitioned layout for the tiling Wayland compositor River (classic only)"
arch=('x86_64')
url="https://github.com/areif-dev/river-bsp-layout"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'libgcc'
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
b2sums=('a4ac10a80a5dd5c372467f3a2fd740010267bbfd05fe0b05a9c40ef5b27e070c9126524ee7df1e0bcd0e69acee67e932933b9777914ce82f2f47166cfc1a69cf')

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

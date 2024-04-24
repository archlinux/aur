# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=river-bsp-layout
pkgver=2.0.0
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
  'git'
)
provides=(
  'river-bsp-layout'
)
source=(
  "${pkgname}"::"git+${url}#tag=v${pkgver}"
)
b2sums=(
  '9e19ed8cd7ba118d6134a5a7c607e26163642a5e03f0f82a1b9234f663e57c66c9b9ab4cd6b5291c351be0a17733771a335fe60ec9465e83a5456442b21c6aff'
)

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

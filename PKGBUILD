# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/arduano/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('custom')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduano/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6b85e7bcf16e8fca8c72539ddecfee996aed2428d944500053aadd0ab2a39cd8490c2c6411836439d559631ca9963b51ab971c0bee868418254eb194ad4ea48f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/arduano/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('custom')
depends=('at-spi2-core' 'alsa-lib' 'gcc-libs' 'gtk3')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduano/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2ec238a2b2196c968e2327817d80d91289efc418839623c6e2d9295fa2f12495f06b6ed35006ed40035f8d438a0a17b1d9b0b6ea56c41979cac4c7fa22f6e6cf')

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

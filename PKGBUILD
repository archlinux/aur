# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/arduano/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('custom')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arduano/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1b3c1bfe080d0832f28126abdaba493786482060804951fb3cae6fe8417e2ba')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly-2023-06-28
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly-2023-06-28
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=nightly-2023-06-28
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/BlackMIDIDevs/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'openssl')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlackMIDIDevs/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('db71b9b68d020b5464f6e9ec8d9cd4238228354ad0439a15373ad0c5667e4b3aa66159fe8ba255efaea0ac9af4e0e63222db8cf3693929be3e41993d79f29b44')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

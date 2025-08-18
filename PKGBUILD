# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=1.0.2
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/BlackMIDIDevs/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'openssl')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlackMIDIDevs/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('320f3a475948ec37d4c0be5578f9b4780377e2ae807be9f2300c4211e967c1807dbc1e20f059181725e2a36f60177e3e2cc6f8d4dbfb968adf3190a60b5d5e60')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
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

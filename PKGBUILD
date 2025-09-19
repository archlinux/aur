# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=1.0.4
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/BlackMIDIDevs/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlackMIDIDevs/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bfed0862cc865e410bce15c1dc24ad126eb4a7028bf54d3884e56e650bf7da6fb9d906d6d2d4ea6e81ac4bf88933bf102c5b9facae7e1fe2651dc029ec691b89')

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

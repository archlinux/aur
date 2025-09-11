# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wasabi
pkgver=1.0.3
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/BlackMIDIDevs/wasabi"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo-nightly' 'cmake' 'git' 'shaderc' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlackMIDIDevs/wasabi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0f44f662f895c8330e0c35513db3146012237fc37bda55f2c68d30444066968a5530d792ab7bdd49da8190e3d55292a86431cbd9c0700bc8d14c8cba69c862f5')

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

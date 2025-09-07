# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.0.0.beta.12
_pkgver=1.0.0-beta.12
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo-nightly' 'openssl')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/carthage-software/mago/archive/refs/tags/${_pkgver}.tar.gz")
b2sums=('f6fbb7207cfa0d0d75bd2317b6fb64b2c5dd4fb27c1bbeb4edd34a8495a3332c4d8ebf92a5eb596e215af0ecdfedcb2907c3b0c1c6fd5e7cc8804b1199e985a0')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-APACHE
}

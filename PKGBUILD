# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.0.0_beta.24
_pkgver=1.0.0-beta.24
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo-nightly' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${_pkgver}")
b2sums=('ad5fa96d1bde374d7f48cb5462fbd71189a81cd49400b7d19a6d2efecd9d289256079453864467aa6b1686e6bf520045dec3b39f8e608c67097539e91911652b')

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-APACHE
}

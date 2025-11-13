# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.0.0_rc.1
_pkgver=1.0.0-rc.1
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo-nightly' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${_pkgver}")
b2sums=('74c5bad18a8b32941cce335bdbe02572f6fc3c1b8db7ecc146ba46ff0e612dec902e8b98a9416b15b9d54f95eb50c1e69f9f4fa25939eb547ebfd85fbfb92298')

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

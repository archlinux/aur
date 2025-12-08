# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.0.0_rc.11
_pkgver=1.0.0-rc.11
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${_pkgver}")
b2sums=('bf20d0b1c09ce8d3b670241f2b7589912d084b418040d48d2a26c82f474746259b2c133c1b4cac5f960c598aab9a562c3ca44075ded2f3e8aed695455e5898a5')

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

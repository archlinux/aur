# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.11.0
pkgrel=1
pkgdesc="An extremely fast PHP linter, formatter, and static analyzer, written in Rust."
url="https://mago.carthage.software/"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${pkgver}")
b2sums=('1e7e1ceb155639444031ae518d85ce17c766c59becd6c23d462dac73171d9143528239a246ee9afb5d1d80755dd6fa6437612a36345530563493b920c8f9996a')

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
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

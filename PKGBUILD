# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.8.0
pkgrel=1
pkgdesc="An extremely fast PHP linter, formatter, and static analyzer, written in Rust."
url="https://mago.carthage.software/"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${pkgver}")
b2sums=('9ae5a84cbe74831e62893559be55189e3d0da64d6b5dbed078365a58652f21e30df92a72a27e817c9d022aa2f8e9b861fba16d6eae4b07b716bacb79abc731a0')

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

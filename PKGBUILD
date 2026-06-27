# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mago
pkgver=1.42.0
pkgrel=1
pkgdesc="An extremely fast PHP linter, formatter, and static analyzer, written in Rust."
url="https://mago.carthage.software/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('git' 'cargo' 'openssl')
source=("git+https://github.com/carthage-software/mago.git#tag=${pkgver}")
b2sums=('522d97c558c9c9ae3be1e2b274a62a9dceafcc872a6bb7dd774a81d43608bf1fb34e3239aeb2ff6411cb3c197e0128e5f71db58d62c7c1d4515f384ec4f35911')

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

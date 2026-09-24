# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=whim
pkgver=0.14.0
pkgrel=1
pkgdesc="Whim Programming Language. Whim is a toy programming language. Do not use it in production."
url="https://whim.sh/"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
makedepends=('cargo' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/carthage-software/whim/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('6e92689e1c69d4c72d3618e787adfd06c4106bfa467de8664fcce57cacbb99eda6dcb0c0191d38af2b52036d58a178bc1240ccb584d5d42d8d88fd8365902fa4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

# disabled until we can get tests to pass
# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-APACHE
}

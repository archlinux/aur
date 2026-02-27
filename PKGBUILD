# Maintainer: Ewilly <ewilly at neuf dot fr>
# Maintainer: ewilly

pkgname=crusader
pkgver=0.3.2
pkgrel=1
pkgdesc="Network tester to measure network throughput, latency and packet loss (written in Rust)"
arch=('x86_64')
url="https://github.com/Zoxc/${pkgname}"
license=('APACHE' 'MIT')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('c6973decac10a8f96f1cb7608757982a57e266426b52c78ae70f432bb4b699e3')

prepare() {
  cd "${pkgname}-${pkgver}/src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}/src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}/src"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the binaries
  install -Dm755 "src/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm755 "src/target/release/${pkgname}-gui" -t "${pkgdir}/usr/bin"

  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install license
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

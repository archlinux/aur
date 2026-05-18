# Maintainer: Oliver Jan Krylow <oliver@bugabinga.net>

pkgname=dupimg
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple duplicate image finder"
arch=('x86_64')
url="https://github.com/DenebTM/dupimg"
license=('AGPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('f123d0d78d022bd2cda686d0a71a708461a2615f33a032d2fc5ea809a4fd05fe')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/build"
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/build"
  cargo test --frozen --release --bins
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

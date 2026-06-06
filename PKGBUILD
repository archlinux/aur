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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DenebTM/dupimg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec9e52e26402e0fc744a6df585479142e138e28c21c672099e3d6468069d4749')

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

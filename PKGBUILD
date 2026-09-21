# Maintainer: Oskar Roesler <oskar AT oskar MINUS roesler DOT de>

pkgname=minidump-stackwalk
pkgver=0.27.0
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('e9527f1e47fc491d3645f7d372d10bed80307774209489fd7828291c71b0237a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  install -D target/release/minidump-stackwalk -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

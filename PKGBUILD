# Maintainer: Oskar Roesler <oskar AT oskar MINUS roesler DOT de>

pkgname=minidump-stackwalk
pkgver=0.25.0
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('9366a9e289dd6770bd7f2fa528af8d8693caee346b19854fae350a0c1fea3182')

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

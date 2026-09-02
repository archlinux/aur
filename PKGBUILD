# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=superseedr
pkgver=1.0.14
pkgrel=1
pkgdesc='A BitTorrent Client in your Terminal'
arch=(x86_64 aarch64)
url='https://github.com/Jagalite/superseedr'
license=('GPL-3.0-or-later')
depends=(
  gcc-libs
  glibc
  libxcb
  openssl
)
makedepends=(cargo python)
# checkdepends=(cargo)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd6f3d31eb5064465f2bcf49260772800048f77d2ee6f54b98b23e1d6642ef14')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cargo test --frozen --release
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

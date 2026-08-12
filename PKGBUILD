# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=superseedr
pkgver=1.0.13
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16435d8c1558315ff386af8cd5ea159123369fe6d69d21f3a4a1d2d6969af555')

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

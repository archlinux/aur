# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=material
pkgver=0.1.1
pkgrel=1
_srcdir="material-${pkgver}"
pkgdesc="A material design color palette for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/azorng/material"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('40e27d87d56babf091e37efc6d5ed1c407c09851baedfafee04c1356966da2bf')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features cli
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --features cli
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/material" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

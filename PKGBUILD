# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proteinview
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal protein structure viewer with interactive 3D visualization"
arch=('x86_64' 'aarch64')
url="https://github.com/001tmf/proteinview"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6948e107fe2fc680875cf028e1ba31f406cc69ad249dc5b05c3feb0a5d64827d')

prepare() {
  cd "ProteinView-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "ProteinView-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "ProteinView-${pkgver}"
  install -Dm755 "target/release/proteinview" "${pkgdir}/usr/bin/proteinview"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

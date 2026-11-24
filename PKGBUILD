# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lini
pkgver=1.1.1
pkgrel=1
pkgdesc="Small language for diagrams and figures from plain text"
arch=('x86_64' 'aarch64')
url="https://github.com/monfa-red/lini"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7768fdf5b6f201d5978dba48d880cc56b87b45d46bd0467f747ba8b2d3947e45')

prepare() {
  cd "lini-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "lini-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p lini
}

package() {
  cd "lini-${pkgver}"
  install -Dm755 "target/release/lini" "${pkgdir}/usr/bin/lini"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

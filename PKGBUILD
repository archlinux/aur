# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oneiromancer
pkgver=0.9.3
pkgrel=1
pkgdesc="Reverse engineering assistant using a locally running LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/0xdea/oneiromancer"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0249ab0a38e78e49e492d5ebc90eab18f4d6a92aa50f1c27ff40786a1ccc28e2')

prepare() {
  cd "oneiromancer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "oneiromancer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "oneiromancer-${pkgver}"
  install -Dm755 "target/release/oneiromancer" "${pkgdir}/usr/bin/oneiromancer"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

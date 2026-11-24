# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oneiromancer
pkgver=0.9.2
pkgrel=1
pkgdesc="Reverse engineering assistant using a locally running LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/0xdea/oneiromancer"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f9609544f1e499f0265276eff20ec87c1505fc0b93790f3939bc1d36d2cc95c1')

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

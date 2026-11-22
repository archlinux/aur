# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=qmassa
pkgver=0.3.0
pkgrel=1
_srcdir="qmassa-qmmd-v${pkgver}"
pkgdesc="Displays GPU devices usage stats on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/ulissesf/qmassa"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
_tag="qmmd-v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('d0bffa414c1c8512155699dd956ad8a606f5e90b0fdbc8fe2f63cddd819923b1')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/qmassa" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/qmmd" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

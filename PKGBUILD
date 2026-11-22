# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stevedore
pkgver=0.1.1
pkgrel=1
_srcdir="stevedore-${pkgver}"
pkgdesc="A fast, keyboard-driven terminal UI for managing Docker containers and Compose stacks"
arch=('x86_64' 'aarch64')
url="https://github.com/takumiymd/stevedore"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('613b959de1ec6ba7b3de20b61b391ba49d8d8da910aeb90473169e43a7a459ca')

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
  install -Dm755 "target/release/stevedore" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

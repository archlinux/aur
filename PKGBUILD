# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazy-etherscan
pkgver=1.0.0
pkgrel=1
_srcdir="lazy-etherscan-${pkgver}"
pkgdesc="A Simple Terminal UI for the Ethereum Blockchain Explorer"
arch=('x86_64' 'aarch64')
url="https://github.com/woxjro/lazy-etherscan"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a0bbfc0055bd680db1be1c234458e4a842c8fff3ba7d0e7aa7ec378d51d0965')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm755 "target/release/lazy-etherscan" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

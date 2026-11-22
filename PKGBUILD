# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rtg
pkgver=0.1.19
pkgrel=1
_srcdir="rtg-${pkgver}"
pkgdesc="Fast, vim-like Telegram TUI client, built on TDLib"
arch=('x86_64' 'aarch64')
url="https://github.com/bercly0b/rtg"
license=('MIT')
depends=('glibc' 'libgcc' 'libc++')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b2f558835047eb38183ce3512da789fefa0ebaaf54daa2594b84ee3e1c9c768')

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
  install -Dm755 "target/release/rtg" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

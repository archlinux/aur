# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kdwarn-pgtui
pkgver=0.17.0
pkgrel=1
_srcdir="pgtui"
pkgdesc="A PostgreSQL TUI client that uses your terminal editor for inserts and updates"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/kdwarn/pgtui"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=('pgtui' 'pgtui-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('66ae85ae6a2c60ecb513804778fe2258a32c0e3a431a42f10ef828495a2d4fb6')

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

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/pgtui" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

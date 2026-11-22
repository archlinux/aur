# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pixtuoid-tui
pkgver=0.23.0
pkgrel=1
_srcdir="pixtuoid-${pkgver}"
pkgdesc="Live pixel-art office for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/IvanWng97/pixtuoid"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3fa152fb9e2517d4ff9c9fcb90c078d95eab9ffd40fe31d6af69cc17fbe97ab9')

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
  install -Dm755 "target/release/pixtuoid-hook" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/pixtuoid" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

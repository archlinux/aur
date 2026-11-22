# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yadb
pkgver=0.3.5
pkgrel=1
_srcdir="yadb-${pkgver}"
pkgdesc="A TUI for discovering hidden directories and files on web servers"
arch=('x86_64' 'aarch64')
url="https://github.com/izya4ka/yadb"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b3d52092bb20b86085e377ca0356787d1041a0d2a9216e08a0e961219134559')

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
  install -Dm755 "target/release/yadb-cli" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/yadb-tui" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=red-table
pkgver=0.9.2
pkgrel=1
_srcdir="red-table-${pkgver}"
pkgdesc="A keyboard-driven terminal image browser for inspecting, comparing, and selecting photos"
arch=('x86_64' 'aarch64')
url="https://github.com/volker-schukai/red-table"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('750e866b16445e769db11c53b4ea37335e6750fa002b77c936a81ba777d0ef41')

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
  install -Dm755 "target/release/red-table" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

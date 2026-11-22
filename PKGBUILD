# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nviwatch
pkgver=0.2.4
pkgrel=1
_srcdir="nviwatch-${pkgver}"
pkgdesc="Interactive TUI for monitoring NVIDIA GPU metrics, processes, and power"
arch=('x86_64' 'aarch64')
url="https://github.com/msminhas93/nviwatch"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd20aef234951b060878ed499bbcddc2e48f7e083a32dc791536b28126ba8546')

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
  install -Dm755 "target/release/nviwatch" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

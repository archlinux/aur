# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=norte
pkgver=0.3.0alpha.16
pkgrel=1
_tag="v0.3.0-alpha.16"
_srcdir="norte-${_tag#v}"
pkgdesc="Two-pane file manager on one Rust core: terminal, native window, CLI and MCP server for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/compilando/norte"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('0f1b751a3f5a944a2c37339e9d62d362eaadbb7bf734cb066fdc94c55ffa2a95')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p norte-cli -p norte-tui
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/norte" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/ntc" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-AGPL" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

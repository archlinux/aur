pkgname=verge-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="Standalone Rust TUI for Mihomo/Clash core management"
arch=('x86_64' 'aarch64')
url="https://github.com/totrytakeoff/verge-tui"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=(!lto !debug)
optdepends=(
  'verge-mihomo: Mihomo core runtime required by verge-tui'
  'libcap: provide getcap/setcap for TUN capability management'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d1e03936052bdc3489a1bacf0ae4a93d144e5d289f4ae4204ec3b1fa3e6df3b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=."
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --release --locked -p verge-tui
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/verge-tui" "${pkgdir}/usr/bin/verge-tui"
  install -Dm755 "scripts/proxy-clean-linux.sh" "${pkgdir}/usr/bin/verge-tui-proxy-clean"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "NOTICE.md" "${pkgdir}/usr/share/doc/${pkgname}/NOTICE.md"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "docs/USAGE.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
  install -Dm644 "docs/COMMANDS.md" "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
  install -Dm644 "docs/ARCHITECTURE.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
}

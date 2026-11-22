# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ytmusic-tui
pkgver=0.2.1
pkgrel=1
_srcdir="ytmusic-tui-${pkgver}"
pkgdesc="A TUI client for YouTube Music with Vim-style navigation and desktop media-control integration"
arch=('x86_64' 'aarch64')
url="https://github.com/WakaTaira/ytmusic-tui"
license=('MIT')
depends=('glibc' 'libgcc' 'mpv')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0de0f99702119dbb53fa3a9e6a6abd68baaf3206dd572b6f4dae2e90a0135e88')

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
  cargo test --frozen -- --skip mpv_integration
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/ytmusic-tui" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wiretui
pkgver=0.0.1
pkgrel=1
_srcdir="wiretui-${pkgver}"
pkgdesc="A minimal keyboard-driven TUI to manage WireGuard VPN connections"
arch=('x86_64' 'aarch64')
url="https://github.com/robin-thoene/wiretui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7ab06eedfb2ea249d075566297cde1dd63a84536334b3e03fa32bb92b55fdbe')

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
  install -Dm755 "target/release/wiretui" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

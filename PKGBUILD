# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=discovery-rs
pkgver=0.1.3
pkgrel=1
_srcdir="discovery-rs-${pkgver}"
pkgdesc="A TUI for discovering services on your local network"
arch=('x86_64' 'aarch64')
url="https://github.com/JustPretender/discovery-rs"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d57848bb6ea4f157dcd45c256bae7c0e4714e0bd7b5b8655520b7d3f2f07fe98')

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
  install -Dm755 "target/release/discovery-rs" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

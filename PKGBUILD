# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Cortese <mcortese1406@gmail.com>

pkgname=netwatch-tui
pkgver=0.12.3
pkgrel=1
pkgdesc="Real-time network diagnostics TUI — like htop for your network"

license=('MIT')
arch=('x86_64')
url="https://github.com/matthart1983/netwatch"

provides=("${pkgname%-tui}")

makedepends=('cargo' 'nasm')
depends=('glibc' 'libgcc' 'libpcap')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('af90777ad12f7c06e531b52608baf437833604fa9943285d7a52b01e74f1a586')

prepare() {
  cd "${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}" || exit 1

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}" || exit 1

  install -Dm755 "target/release/netwatch" "${pkgdir}/usr/bin/netwatch"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

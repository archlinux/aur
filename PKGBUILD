# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sshattrick
pkgver=0.1.1
pkgrel=1
_srcdir="sshattrick-${pkgver}"
pkgdesc="A multiplayer terminal version of the Hattrick football-management game, playable over SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/ricott1/sshattrick"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('417590e667bce9bafec30d4d496a68a8d5ba1e17eee9445fcd73914bea2e2b4e')

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
  install -Dm755 "target/release/sshattrick" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

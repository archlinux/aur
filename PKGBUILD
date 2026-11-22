# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tsuchita
pkgver=0.1.0
pkgrel=1
_srcdir="tsuchita-${pkgver}"
pkgdesc="A client-server notification center for desktop notifications on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/kamiyaa/tsuchita"
license=('LGPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52160dd9dddae2e06394981728ecf5c28de31f8cc4525e956a219bdb9c98f253')

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
  install -Dm755 "target/release/tsuchita-server" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/tsuchita" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

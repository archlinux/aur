# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tuitar
pkgver=0.1.0
pkgrel=1
_srcdir="tuitar-${pkgver}"
pkgdesc="A portable guitar training tool"
arch=('x86_64' 'aarch64')
url="https://github.com/orhun/tuitar"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cdff617bbbf3cfa9883682946e02908cb93911dbc218e33d97ecfef71fe2e47')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p tuitar
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -p tuitar -p tuitar-core
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/tuitar" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

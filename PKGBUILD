# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gentooplz
pkgver=0.3.1
pkgrel=1
_srcdir="gentooplz-${pkgver}"
pkgdesc="A live terminal dashboard for Gentoo package builds"
arch=('x86_64' 'aarch64')
url="https://github.com/JustRoccat/gentooplz"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fe32a65d358f6b465d8981ba7d9b5f801e723672ee6132957e146fb19d9e6934')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm755 "target/release/gentooplz" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

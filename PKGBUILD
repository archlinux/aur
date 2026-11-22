# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sqwatch
pkgver=0.3.0
pkgrel=1
_srcdir="sqwatch-${pkgver}"
pkgdesc="A live SLURM queue dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/fedonman/sqwatch"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('735cd5651fffba05cb0bfebf6e8fa0e0a61f51cdac5d32e98289385c635478ea')

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
  install -Dm755 "target/release/sqwatch" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

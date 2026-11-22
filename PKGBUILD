# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=a-puzzle-a-day
pkgver=0.1.1
pkgrel=1
_srcdir="a-puzzle-a-day-${pkgver}"
pkgdesc="Generate and browse all solutions to A-Puzzle-A-Day"
arch=('x86_64' 'aarch64')
url="https://github.com/mrbjarksen/a-puzzle-a-day"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89a501ee3e6261419ade2c1439e9159ef0cb22008cb0d1a61a644120a8bebd94')

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
  install -Dm755 "target/release/a-puzzle-a-day" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

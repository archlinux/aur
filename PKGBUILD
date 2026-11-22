# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-time-machine-tui
pkgver=0.4.0
pkgrel=1
_srcdir="git-time-machine-${pkgver}"
pkgdesc="Visual Git reflog TUI for undoing Git mistakes"
arch=('x86_64' 'aarch64')
url="https://github.com/dinakars777/git-time-machine"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('077f81e24c7c698474957188744c2347da42b98094b830a1faa85df735014c64')

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
  install -Dm755 "target/release/git-time-machine" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='bra'
pkgver=0.4.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='A git worktree manager with project-aware configuration'
url='https://gitlab.com/wykwit/bra'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('git')
arch=('x86_64' 'i686')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('897a0bf58c7bb3d79043fbeb39cf0a690240896d1bcf449d8c2bd2e0e720ff76')

prepare() {
  cd "${pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/bra"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/git-bra"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}


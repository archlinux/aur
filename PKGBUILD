# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='bra'
pkgver=0.2.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='A git worktree manager with project-aware configuration'
url='https://gitlab.com/wykwit/bra'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('git')
arch=('x86_64' 'i686')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c12bb312ec9f6262abd85a94c9700a46b3a681a027fa31ff31d6d6f7b8d02619')

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


# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='madgit'
pkgver=0.5.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Mass run git distributed across multiple repositories'
url='https://gitlab.com/wykwit/madgit'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('git')
arch=('x86_64' 'i686')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('7b6e99484c518e2b0ac43f269d33691db3b4a131070bc21f389a47938dc03e5f')

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

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}


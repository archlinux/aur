# Maintainer: Jonas Verhofsté <jonas@verhofste.tech>

pkgname='anyrun-provider'
pkgver='25.12.0'
pkgrel=1
pkgdesc='A simple program to load Anyrun plugins and interact with them.'
url='https://github.com/anyrun-org/anyrun-provider'
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('cargo')
options=('!lto')

_pkgsrc="${pkgname}-${pkgver}"
_pkgext='tar.gz'
source=("${_pkgsrc}.${_pkgext}"::"${url}/archive/refs/tags/v${pkgver}.${_pkgext}")
sha256sums=('d9b4afcb7bafc4e4d43c64bd6ec8110ae3b858964d68d164c24c0c6505831dd6')

_targetdir='target'

prepare() {
  cd "${_pkgsrc}"
  export RUSTUP_TOOLCHAIN='stable'
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_pkgsrc}"
  export RUSTUP_TOOLCHAIN='stable'
  export CARGO_TARGET_DIR="${_targetdir}"
  cargo build --frozen --release --all-features
}

package() {
  cd "${_pkgsrc}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${_targetdir}/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}

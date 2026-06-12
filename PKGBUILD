# Maintainer: Fluree <development@flur.ee>

pkgname=fluree-bin
pkgver=4.0.6
pkgrel=1
pkgdesc='Fluree — semantic graph database (CLI and embedded server)'
arch=('x86_64' 'aarch64')
url='https://flur.ee'
license=('custom:BUSL-1.1')
depends=('glibc' 'gcc-libs')
provides=('fluree')
conflicts=('fluree')
# Upstream ships a stripped, statically-linked-where-possible binary.
options=('!strip' '!debug')

_archive_x86_64="fluree-db-cli-x86_64-unknown-linux-gnu"
_archive_aarch64="fluree-db-cli-aarch64-unknown-linux-gnu"
_release_url="https://github.com/fluree/db/releases/download/v${pkgver}"

source_x86_64=("${_archive_x86_64}-${pkgver}.tar.xz::${_release_url}/${_archive_x86_64}.tar.xz")
source_aarch64=("${_archive_aarch64}-${pkgver}.tar.xz::${_release_url}/${_archive_aarch64}.tar.xz")

sha256sums_x86_64=('bfb94b8ebf2f4eb2d6584d57321de96252f095d2b7cca4d4f9c0a265a0cd5e51')
sha256sums_aarch64=('da9565add420fec014f147b6ad8736b47b6bb6accad1b0592abfebdcdb52feed')

package() {
  local _archive_var="_archive_${CARCH}"
  local _archive="${!_archive_var}"
  local _srcdir="${srcdir}/${_archive}"

  install -Dm755 "${_srcdir}/fluree" "${pkgdir}/usr/bin/fluree"
  install -Dm644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${_srcdir}/fluree" completions bash > "${pkgdir}/usr/share/bash-completion/completions/fluree"
  "${_srcdir}/fluree" completions zsh  > "${pkgdir}/usr/share/zsh/site-functions/_fluree"
  "${_srcdir}/fluree" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/fluree.fish"
}

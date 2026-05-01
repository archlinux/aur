# Maintainer: Fluree <development@flur.ee>

pkgname=fluree-bin
pkgver=4.0.2
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

sha256sums_x86_64=('adb5d43ca58eecca485b4c3b9431d9494d20991b53defc7580a6bc6491da3e4c')
sha256sums_aarch64=('c927c0c9f27cb172e28d4fb2e8d136c69afbb4b5c9ca4db90495bc612a79f421')

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

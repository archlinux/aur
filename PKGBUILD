# Maintainer: Serge K <arch@phnx47.net>

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgver=0.47.6
pkgrel=1
pkgdesc='Pluggable multi-language version manager'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64' 'aarch64')
depends=('git' 'gcc-libs' 'xz')
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('6d0c96ebf07eba6300ac0339616de8b4c6d5aff2aeb9348c4ad199a5b02644b3')
sha256sums_aarch64=('5ed01b0d5ba0c58b8f9552cc64da2d1a2879ba02ddad7d368fc63cfc046b5359')

prepare() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"
  mkdir -p completions
  "./${_pkgname}" completions --shell bash >"completions/bash"
  "./${_pkgname}" completions --shell zsh >"completions/zsh"
  "./${_pkgname}" completions --shell fish >"completions/fish"
}

package() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "${_pkgname}-shim" -t "${pkgdir}/usr/bin"
  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}

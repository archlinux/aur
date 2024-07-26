# Maintainer: Serge K <arch@phnx47.net>

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='Pluggable multi-language version manager'
pkgver=0.39.1
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git' 'gcc-libs' 'xz')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
sha256sums=('f87c70a37e0e4744db0e82a3dcd8bc496d7cfca56a1dbd2c0ce6f544fd200be5')

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

# Maintainer: Serge K <arch@phnx47.net>

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgver=0.50.4
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
sha256sums_x86_64=('07900b7b8b1fac5dc92c921d5deea0a272622d34e05c1182e5ffc24f62485171')
sha256sums_aarch64=('25117f7c53bd84563c9fbb1b0327f3dc73d96117065421c1dd3d97437c048452')

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

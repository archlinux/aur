# Maintainer: Serge K <arch@phnx47.net>

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgver=0.54.0
pkgrel=1
pkgdesc='Pluggable multi-language version manager'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'git' 'unzip' 'gzip' 'xz')
optdepends=('rustup: support for Rust toolchains')
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('6301586bc29f837a2d42220f2f985181a0565d19247077dda1693c8309a1d287')
sha256sums_aarch64=('96621cb6cb19f139ed0697e67d14146ae34b075cf6523ca899b43dd33b006dd4')

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

# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgver=0.64.1
pkgrel=1
pkgdesc='Pluggable multi-language version manager'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64' 'aarch64')
depends=('glibc' 'libgcc' 'git' 'unzip' 'gzip' 'xz')
optdepends=('rustup: support for Rust toolchains')
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/proto_cli-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('3c1e9d5b5308d398ef14e331b5d03ed809e751553a420164c53278427d0e800c')
sha256sums_aarch64=('37fc55586ecd5ca0208b371668c31b7c23569e90c6b6e16a9632e89c7a52ab49')

prepare() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"

  mkdir -p completions
  "./${_pkgname}" completions --shell bash >"completions/bash"
  "./${_pkgname}" completions --shell zsh >"completions/zsh"
  "./${_pkgname}" completions --shell fish >"completions/fish"
  "./${_pkgname}" completions --shell nushell >"completions/nushell"
  "./${_pkgname}" completions --shell elvish >"completions/elvish"
}

package() {
  cd "proto_cli-${CARCH}-unknown-linux-gnu"

  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "${_pkgname}-shim" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm 644 "completions/nushell" "${pkgdir}/usr/share/nushell/vendor/autoload/${_pkgname}.nu"
  install -Dm 644 "completions/elvish" "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"
}

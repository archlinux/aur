# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_pkgname=moon
pkgname="${_pkgname}-bin"
pkgver=2.5.6
pkgrel=1
pkgdesc='Task runner and repo management tool for the web ecosystem'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/moon'
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.xz::${url}/releases/download/v${pkgver}/moon_cli-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.xz::${url}/releases/download/v${pkgver}/moon_cli-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1938c4e3445cc64759e2d1a4c393685021a967d0e3f135dc586241254a1192cd')
sha256sums_aarch64=('cb2baeec4bb89df1fc224fac04b17fd8002b444380e51f2b212cbbc6cd8246f3')

prepare() {
  cd "moon_cli-${CARCH}-unknown-linux-gnu"

  mkdir -p completions
  "./${_pkgname}" completions --shell bash >"completions/bash"
  "./${_pkgname}" completions --shell zsh >"completions/zsh"
  "./${_pkgname}" completions --shell fish >"completions/fish"
  "./${_pkgname}" completions --shell nushell >"completions/nushell"
  "./${_pkgname}" completions --shell elvish >"completions/elvish"
}

package() {
   cd "moon_cli-${CARCH}-unknown-linux-gnu"

  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "${_pkgname}x" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm 644 "completions/nushell" "${pkgdir}/usr/share/nushell/vendor/autoload/${_pkgname}.nu"
  install -Dm 644 "completions/elvish" "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"
}

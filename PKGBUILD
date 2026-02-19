# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgname=rgrc
pkgname=${_pkgname}-bin
pkgver=0.6.12
pkgrel=1
pkgdesc='Rusty Generic Colouriser - like grc but faster and with more features'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url='https://github.com/lazywalker/rgrc'
provides=($pkgname)
conflicts=($_pkgname)
license=('MIT')
source=("rgrc-source-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=(rgrc_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/rgrc-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=(rgrc_${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/rgrc-aarch64-unknown-linux-musl.tar.gz)
source_i686=(rgrc_${pkgver}_i686.tar.gz::${url}/releases/download/v${pkgver}/rgrc-i686-unknown-linux-musl.tar.gz)
source_arm=(rgrc_${pkgver}_arm.tar.gz::${url}/releases/download/v${pkgver}/rgrc-arm-unknown-linux-musleabihf.tar.gz)

sha256sums=('3cbb9f3df9b605c5a68ccb2096660582b68c6aa708c863da50b9dba390fda735')
sha256sums_i686=('442c25a76a66dcadd147b3bf2c6806ef8a6da07c0d8c8cf18ca4778d02fb9deb')
sha256sums_x86_64=('b7cc92b97168f2d5967bfc500953d97a9711313408ddea3004d80853d5251d1d')
sha256sums_arm=('f3edcd90dad1c3bf8a7be54665134b7f55d3780ec487c030cc5732edd004e392')
sha256sums_aarch64=('a61dd78722142ed12a1937e8f90b17ef7c02308e3e39b1cab726bd33b6e0d56c')

build() {
  # Generate shell completions
  mkdir -p "${srcdir}/completions"
  "${srcdir}/${_pkgname}" --completions=zsh > "${srcdir}/completions/_${pkgname}"
  "${srcdir}/${_pkgname}" --completions=bash > "${srcdir}/completions/${pkgname}"
  "${srcdir}/${_pkgname}" --completions=fish > "${srcdir}/completions/${pkgname}.fish"

  # Generate man pages
  gzip -fk "${srcdir}/$_pkgname-$pkgver/doc/rgrc.1"
}

package() {
  # Install binary (config files are embedded)
  install -Dm 0755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Install shell completions
  install -Dm 0644 "${srcdir}/completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm 0644 "${srcdir}/completions/${pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 0644 "${srcdir}/completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

  # Install man pages
	install -Dm 0644 "${srcdir}/$_pkgname-$pkgver/doc/rgrc.1.gz" -t "${pkgdir}/usr/share/man/man1/"

  # Install license
	install -Dm 0644 "${srcdir}/$_pkgname-$pkgver/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgname=rgrc
pkgname=${_pkgname}-bin
pkgver=0.6.14
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

sha256sums=('d15127cc01bde53e00f47f49362fb3c1867d82ee07a2cde4a62deb2d5748ad46')
sha256sums_i686=('f3c0465d13e69380dcf1df8815d8d9188e19280eb51c52471cae45e8156efb0b')
sha256sums_x86_64=('e24d4ffc2cc5cc1bdae3e7e91f2841e94afb7832a35fd0b5b5f91909b82db6dc')
sha256sums_arm=('1ce9e7878cd384b6dec9c255f72350ca8480dcdb82a8bcc8f85a6682095a6c64')
sha256sums_aarch64=('0e12545384c3c76396ff2afb42a53c15ef244a994fad7b271a016b56a9a0e499')

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

# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgname=rgrc
pkgname=${_pkgname}-bin
pkgver=0.6.13
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

sha256sums=('b4cbec24a139b82e84c60fb72eaf189c3503671f10f3f1d9f3058227fc80fe98')
sha256sums_i686=('ac8f280292daa91f69399b8768dae28d95efa2a5e417aba124bda018b9eeb860')
sha256sums_x86_64=('f0f730a80959d0a3a910bb28cfbe81656d105b1aa4403a4591a6126021c98fc2')
sha256sums_arm=('17a36e86ba800c3b842d69b959cb4fbd70fe4595e7c30d88e2c66f2383a544ff')
sha256sums_aarch64=('31a1811d3b4897dff9fcf49ecdfbb85b62a5c044aeb1ca5c2bcf0ea1f763599f')

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

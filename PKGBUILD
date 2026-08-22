# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgname=rgrc
pkgname=${_pkgname}-bin
pkgver=0.6.30
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

sha256sums=('11055f095d1f8055a3edd993e89af9ca9974c7dcb36b4dcba70f88248bbef620')
sha256sums_i686=('a2719075d654bf38375376c04b11a00fbe45e092086a2f933a11fab95bb9d102')
sha256sums_x86_64=('6891d69e739070512cfacd6758486ee7e9fdffdd220afdd416676584796997f8')
sha256sums_arm=('26fd2d39937fdbc681532306bc0e020a004490282d7f13922c6c9710dcbc6a09')
sha256sums_aarch64=('208a8a872d931961435af2e11752deccc221107aa2239a29057d6864a047899a')

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

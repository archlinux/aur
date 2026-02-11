# Maintainer: lazywalker <lazywalkerz@gmail.com>

_pkgname=rgrc
pkgname=${_pkgname}-bin
pkgver=0.6.9
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

sha256sums=('ffa507532d92f8f7e80e8ed03a18a4c3864e1c235582114a11883bc090433419')
sha256sums_i686=('1791bf92f82daa26387cf4706d21f950f1dff91bd3b38689672a109c78ba097a')
sha256sums_x86_64=('0ac969dfb7733ad2c5034042e94ba462e706df115cf7dcb3cc83c6234d290c99')
sha256sums_arm=('a29287dbb47f0feedcbe962fc4759251015cb1817e1a0f99a938cd27c9912312')
sha256sums_aarch64=('e884291f8b344e1b93225dee24ac17ca0bb6dcc04a278b3b8db6f1e944220098')

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
  install -Dm 0755 "${srcdir}/rgrv" "${pkgdir}/usr/bin/rgrv"

  # Install shell completions
  install -Dm 0644 "${srcdir}/completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm 0644 "${srcdir}/completions/${pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 0644 "${srcdir}/completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

  # Install man pages
	install -Dm 0644 "${srcdir}/$_pkgname-$pkgver/doc/rgrc.1.gz" -t "${pkgdir}/usr/share/man/man1/"

  # Install license
	install -Dm 0644 "${srcdir}/$_pkgname-$pkgver/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

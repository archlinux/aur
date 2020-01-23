# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
provides=('authelia')
conflicts=('authelia')
backup=('etc/authelia/configuration.yml')

source=('authelia.service')
source_x86_64=("https://github.com/${pkgname/-bin/}/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/${pkgname/-bin/}/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-arm64v8.tar.gz")
source_armv7h=("https://github.com/${pkgname/-bin/}/${pkgname/-bin/}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-arm32v7.tar.gz")

sha256sums=('d1fe188957465088e6a6814d068016862a85b20fc40d60c12b28d12debe2e33e')
sha256sums_x86_64=('13c785219ed8d48cc79869f82f371408fcfbf87994ea673b5f6f1af5ecc93207')
sha256sums_aarch64=('59c8e2841ed9f51fe53723b0e984fe1e31fb860201040a5f7a60adcc7938aa9a')
sha256sums_armv7h=('b8f47c5e887bffe5045b9aecc06d73e3038eabca5f6db474f19e88880a76baec')

package() {
  cd "${srcdir}"

  install -Dm700 "${srcdir}/config.template.yml" "${pkgdir}/etc/${pkgname/-bin/}/configuration.yml"
  install -Dm700 "${srcdir}/${pkgname/-bin/}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"

  if [[ ${CARCH} == 'x86_64' ]]; then
    install -Dm755 "${srcdir}/${pkgname/-bin/}-linux-amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  elif [[ ${CARCH} == 'aarch64' ]]; then
    install -Dm755 "${srcdir}/${pkgname/-bin/}-linux-arm64v8" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  else
    install -Dm755 "${srcdir}/${pkgname/-bin/}-linux-arm32v7" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  fi

  install -dm655 "${pkgdir}/usr/share/webapps/${pkgname/-bin/}"
  cp -r "${srcdir}/public_html/." "${pkgdir}/usr/share/webapps/${pkgname/-bin/}/"
}

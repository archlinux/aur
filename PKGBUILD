# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='snmp_exporter'
pkgver='0.14.0'
pkgrel='1'
pkgdesc='This is an exporter that exposes information gathered from SNMP for use by the Prometheus monitoring system'
arch=('x86_64' 'i686')
url="https://github.com/prometheus/${pkgname}"
license=('Apache')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('e530c4e2eec4520ec8223fc70270e316032ad9d37dca92980916d0ff1b41679c'
            '0f1b59f5b416b37665ddb5ab3cf40a4fc4bf0c4622f68da018793194dc2f1206'
            '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/prometheus"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/prometheus/${pkgname}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/${pkgname}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "snmp.yml" "${pkgdir}/etc/prometheus/snmp.yml"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.sysusers"
}

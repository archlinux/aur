# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='snmp_exporter'
pkgver='0.16.1'
pkgrel='1'
pkgdesc='This is an exporter that exposes information gathered from SNMP for use by the Prometheus monitoring system'
arch=('x86_64' 'i686')
url="https://github.com/prometheus/${pkgname}"
license=('Apache')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('0990c2f2d846aa22c67fec22e7c59737d42907402f29137d80e751abcd3fca92'
            '0f1b59f5b416b37665ddb5ab3cf40a4fc4bf0c4622f68da018793194dc2f1206'
            '2747fabb4e56b808361eb7dd7acf9729ab8973d1ebe2f857dd56f6c71f71e45f')
backup=("etc/prometheus/snmp.yml")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/prometheus"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/prometheus/${pkgname}"
}

build() {
  cd "${GOPATH}/src/github.com/prometheus/${pkgname}"
  make build
}

package() {
  pushd "${GOPATH}/src/github.com/prometheus/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm640 -o210 -g210 "snmp.yml" "${pkgdir}/etc/prometheus/snmp.yml"
  popd
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

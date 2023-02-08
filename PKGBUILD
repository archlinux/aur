# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='snmp_exporter'
pkgver='0.21.0'
pkgrel='1'
pkgdesc='SNMP exporter for Prometheus'
arch=('x86_64' 'i686')
_uri='github.com/prometheus'
url="https://${_uri}/${pkgname}"
license=('Apache')
makedepends=('go' 'yamllint')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('a6ed31a8fd723a8c7d2880fd21d93fd2c9ae24fa4fdeb3834e72dccd8a3e1fb3'
            '0f1b59f5b416b37665ddb5ab3cf40a4fc4bf0c4622f68da018793194dc2f1206'
            '2747fabb4e56b808361eb7dd7acf9729ab8973d1ebe2f857dd56f6c71f71e45f')
backup=("etc/prometheus/snmp.yml")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  make build
}

package() {
  pushd "${GOPATH}/src/${_uri}/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm640 -o210 -g210 "snmp.yml" "${pkgdir}/etc/prometheus/snmp.yml"
  popd
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

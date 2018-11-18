# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Rémi Audebert <rflah0@gmail.com>

pkgname=prometheus-node-exporter
pkgver=0.16.0
pkgrel=2
pkgdesc="Prometheus exporter for machine metrics"
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/conf.d/prometheus_node_exporter')
source=("https://github.com/prometheus/node_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-node-exporter.service"
        "prometheus_node_exporter.conf")
sha512sums=('59a2286024de76e7213e430ba77a366190d626d3b410c8dc960ad2bf68798e8ec3aeb851396673fb402eef15b2596f6835cf0197a53b9a3d1c0f8a1a81965fc7'
            '0e285424d111dc5b5b3421d11304426c3354941376e35be23948d41666765d4c9f7a0fdd8428d636bad50d9b67a52d3fb3fb8054749337ca59e8a2bf5f22e965'
            'fed767e4949e938c0e6e87c3451f7ba16f35fb870aa4ac5007bf66092a6dfb7b410cff048ec0b24c675866a4dbc81f9b12f3790c37bd58f9945fea97495815cc')

prepare() {
  cd "${srcdir}/node_exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/prometheus"
  ln -snf "${srcdir}/node_exporter-${pkgver}" \
    "${GOPATH}/src/github.com/prometheus/node_exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/node_exporter"

  make build
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/node_exporter"

  make test test-e2e -o build
}

package() {
  cd "${srcdir}/node_exporter-${pkgver}"

  install -Dm755 "node_exporter" "${pkgdir}/usr/bin/prometheus_node_exporter"
  install -Dm644 "${srcdir}/prometheus-node-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-node-exporter.service"
  install -Dm644 "${srcdir}/prometheus_node_exporter.conf" \
    "${pkgdir}/etc/conf.d/prometheus_node_exporter"
}

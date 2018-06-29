# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Rémi Audebert <rflah0@gmail.com>

pkgname=prometheus-node-exporter
pkgver=0.16.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics"
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/prometheus/node_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-node-exporter.service")
sha256sums=('2ed1c1c199e047b1524b49a6662d5969936e81520d6613b8b68cc3effda450cf'
            '57469c6f18063ab430a4f7ccca3e4976e36ebaeb2a633ede4b3225ef880b23f6')

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
}

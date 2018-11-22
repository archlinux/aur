# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-generator
pkgver=0.13.0
pkgrel=5
pkgdesc="Generator parse MIBs and generates configs for the snmp_exporter"
arch=('any')
url="https://github.com/prometheus/snmp_exporter/tree/master/generator"
license=('Apache')
makedepends=('git' 'go')
depends=('net-snmp')
source=("https://github.com/prometheus/snmp_exporter/archive/v${pkgver}.tar.gz")
sha256sums=('ca03ec869c4628643b5007e041c45fe776040b7ac891f74fa4bc9a02bceea8df')

prepare() {
    export GOPATH="${srcdir}/gopath"
    mkdir -p "${GOPATH}/src/github.com/prometheus/"
    ln -snf "${srcdir}/snmp_exporter-${pkgver}" "${GOPATH}/src/github.com/prometheus/snmp_exporter"

    cd "${srcdir}/gopath"
    go get -v github.com/prometheus/common/log
}

build() {
    export GOPATH="${srcdir}/gopath"
    cd "${GOPATH}/src/github.com/prometheus/snmp_exporter/generator"

    go build
}

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}/generator"

    install -Dm755 "generator" "${pkgdir}/usr/bin/prometheus_snmp_exporter_generator"
    install -Dm644 "generator.yml" "${pkgdir}/usr/share/doc/prometheus_snmp_exporter_generator/generator.yml.example"
}

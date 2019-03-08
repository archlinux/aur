# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-generator
pkgver=0.15.0
pkgrel=5
pkgdesc="Generator parse MIBs and generates configs for the snmp_exporter"
arch=('any')
url="https://github.com/prometheus/snmp_exporter/tree/master/generator"
license=('Apache')
makedepends=('git' 'go')
depends=('net-snmp')
source=("https://github.com/prometheus/snmp_exporter/archive/v${pkgver}.tar.gz")
sha512sums=('1050a25d12a8201deab0ab7ea95dc35e250954a321d14251c10f87b016c879cf036e01f4043e3463607200381de63f12ea6bcf094dea2939707545f978c2675b')

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

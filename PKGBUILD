# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-generator
pkgver=0.18.0
pkgrel=5
pkgdesc="Generator parse MIBs and generates configs for the snmp_exporter"
arch=('any')
url="https://github.com/prometheus/snmp_exporter/tree/master/generator"
license=('Apache')
makedepends=('git' 'go')
depends=('net-snmp')
source=("https://github.com/prometheus/snmp_exporter/archive/v${pkgver}.tar.gz")
sha512sums=('ea24d58053089e16b091353ccbb387346f2bef825f181efc8b347349d72a624ecda3269d3261ca0503bcb3c565e723c4a4685b8445a46e38efb892fd2ac7ce89')

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

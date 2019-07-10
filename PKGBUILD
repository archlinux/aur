# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-dovecot-exporter-git
_pkgname=prometheus-dovecot-exporter
pkgver=7ef7911
pkgrel=1
pkgdesc="Prometheus exporter that can be used to scrape statistics from Dovecot "
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/kumina/dovecot_exporter"
license=("Apache")
makedepends=("git" "go")
source=("${_pkgname}::git+https://github.com/kumina/dovecot_exporter.git"
        "prometheus-dovecot-exporter.service")
sha256sums=("SKIP"
            "0351247da910eb87741b71f9cc8fda70ecfca627d1ecd4aaf2003a9a3c0602d7")

pkgver() {
    cd ${srcdir}/${_pkgname}

    git describe --always | sed "s|-|.|g"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    export GOPATH="${srcdir}/gopath"
    go get -d ./...
}

build() {
    cd "${srcdir}/${_pkgname}"

    export GOPATH="${srcdir}/gopath"
    go build --ldflags "-extldflags "-static""
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "prometheus-dovecot-exporter" "${pkgdir}/usr/bin/prometheus_dovecot_exporter"
    install -Dm755 "${srcdir}/prometheus-dovecot-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-dovecot-exporter.service"
}

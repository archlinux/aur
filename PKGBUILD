# Maintainer: Kévin Hautemanière <kh12e@pm.me>
pkgname=prometheus-transmission-exporter
pkgver=0.3.0
pkgrel=1
pkgdesc="Prometheus exporter for transmission daemon"
arch=('x86_64')
url="https://github.com/metalmatze/transmission-exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/metalmatze/transmission-exporter/archive/${pkgver}.tar.gz"
        "prometheus-transmission-exporter.service"
        "prometheus-transmission-exporter.default")
sha256sums=('1c5db560bfa8c181d96e3beafa4347be4384945fcc5eb446bd0149bbe5a8cb13'
            '39a46c0e07065892e0d31e1ad38fb70e26ee2b693da0fc2d88d944f3958d6496'
            'f2bfede724cee3fb0893f67bd601c3f59c3522c6b92bddf671dc5b3daad6fa54')

prepare() {
    cd "${srcdir}/transmission-exporter-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export GOBIN="${GOPATH}/bin"
    mkdir -p "${GOPATH}/src/github.com/metalmatze"
    ln -snf "${srcdir}/transmission-exporter-${pkgver}" "${GOPATH}/src/github.com/metalmatze/transmission-exporter"
}

build() {
    export GOPATH="${srcdir}/gopath"
    cd "${GOPATH}/src/github.com/metalmatze/transmission-exporter"
    go build ./cmd/transmission-exporter
}

package() {
    install -Dm640 "prometheus-transmission-exporter.default" "${pkgdir}/etc/default/prometheus-transmission-exporter"
    install -Dm644 "prometheus-transmission-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-transmission-exporter.service"
    cd transmission-exporter-${pkgver}
    install -Dm755 "transmission-exporter" "${pkgdir}/usr/bin/prometheus-transmission-exporter"
}

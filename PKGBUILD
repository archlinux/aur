# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

_gitname=clamav-prometheus-exporter
pkgname=prometheus-clamav-exporter
pkgdesc="Prometheus-Exporter for ClamAV"
pkgver=1.0.1
pkgrel=1
arch=("any")
url="https://github.com/r3kzi/clamav-prometheus-exporter"
license=('Apache')
makedepends=('git' 'go')
source=("https://github.com/r3kzi/clamav-prometheus-exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "prometheus-clamav-exporter.service")
sha256sums=('c72af8fdf4a5dcb97ea49ffc5dcd99387d5fea660f91b7f045f109c1697d2c8d'
            '1ce1a94c1596ad0035eb2f4977015ce8c7e662eff7cf7b7d49eb69b2ebb35a5b')

build(){
    cd "${srcdir}/${_gitname}-${pkgver}/"

        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

        go build -o prometheus-clamav-exporter .
}

package () {
    cd "${srcdir}/"

        install -Dm 755 "${_gitname}-${pkgver}/prometheus-clamav-exporter" "${pkgdir}/usr/bin/prometheus-clamav-exporter"
        install -Dm 644 ./prometheus-clamav-exporter.service "${pkgdir}/usr/lib/systemd/system/prometheus-clamav-exporter.service"

}

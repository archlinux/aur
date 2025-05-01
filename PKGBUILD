# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

_gitname=clamav-prometheus-exporter
pkgname=prometheus-clamav-exporter-git
pkgdesc="Prometheus-Exporter for ClamAV"
pkgver=r46.5023a03
pkgrel=2
arch=("any")
url="https://github.com/r3kzi/clamav-prometheus-exporter"
license=('Apache')
makedepends=('git' 'go')
provides=('prometheus-clamav-exporter')
conflicts=('prometheus-clamav-exporter')
source=("git+https://github.com/r3kzi/clamav-prometheus-exporter.git"
        "prometheus-clamav-exporter.service")
sha256sums=('SKIP'
        '1ce1a94c1596ad0035eb2f4977015ce8c7e662eff7cf7b7d49eb69b2ebb35a5b')

pkgver() {
    cd "${srcdir}/${_gitname}/"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/${_gitname}/"

        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

        go build -o prometheus-clamav-exporter .
}

package () {
    cd "${srcdir}/"

        install -Dm 755 "${_gitname}/prometheus-clamav-exporter" "${pkgdir}/usr/bin/prometheus-clamav-exporter"
        install -Dm 644 ./prometheus-clamav-exporter.service "${pkgdir}/usr/lib/systemd/system/prometheus-clamav-exporter.service"

}

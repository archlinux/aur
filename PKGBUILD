# Maintainer: Kévin Hautemanière <kh12e@pm.me>
pkgname=prometheus-transmission-exporter
pkgver=0.3.0
pkgrel=4
pkgdesc="Prometheus exporter for transmission daemon"
arch=('x86_64')
url="https://github.com/metalmatze/transmission-exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metalmatze/transmission-exporter/archive/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default")
sha256sums=('1c5db560bfa8c181d96e3beafa4347be4384945fcc5eb446bd0149bbe5a8cb13'
            '2ff8ba57ed48879512459e87979e8de08c083626f7a3111871f8eaeb20006d25'
            'f2bfede724cee3fb0893f67bd601c3f59c3522c6b92bddf671dc5b3daad6fa54')
backup=("etc/default/${pkgname}")

build() {
    export GO111MODULE=on
    export CGO_ENABLED=0
    cd transmission-exporter-${pkgver}
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o ${pkgname} \
        ./cmd/transmission-exporter
}

package() {
    install -Dm640 ${pkgname}.default ${pkgdir}/etc/default/${pkgname}
    install -Dm644 ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
    cd transmission-exporter-${pkgver}
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

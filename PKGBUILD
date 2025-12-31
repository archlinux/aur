# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui'
pkgver=0.0.3
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops'
url='https://github.com/jmylchreest/histui'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
makedepends=('go' 'git' 'gobject-introspection')
provides=('histui' 'histuid')
conflicts=('histui-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jmylchreest/histui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1321cab0a354ade1a83434a76b6969f76e9de08391e8703c2bfa0f09183c9a4a')

build() {
    cd "${pkgname}-${pkgver}"

    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    # histui CLI - pure Go, no CGO needed
    CGO_ENABLED=0 go build \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o histui ./cmd/histui

    # histuid daemon - requires CGO for GTK4 bindings
    CGO_ENABLED=1 go build \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o histuid ./cmd/histuid
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 histui "${pkgdir}/usr/bin/histui"
    install -Dm755 histuid "${pkgdir}/usr/bin/histuid"
    install -Dm644 contrib/histuid.service "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 contrib/histuid-monitor.service "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

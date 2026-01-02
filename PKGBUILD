# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui'
pkgver=0.0.5
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
sha256sums=('920bc0db96c0edd43b7e2c30a51e564ceb55782285ffa4f308f9756811f0e0e6')

build() {
    cd "${pkgname}-${pkgver}"

    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    # Build metadata
    local _commit="95f4758d9e1db339c9585161084dc3801a4b4ea6"
    local _buildtime="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    local _ldflags="-s -w -X main.version=${pkgver} -X main.commit=${_commit} -X main.buildTime=${_buildtime}"

    # histui CLI - pure Go, no CGO needed
    CGO_ENABLED=0 go build \
        -ldflags "${_ldflags}" \
        -o histui ./cmd/histui

    # histuid daemon - requires CGO for GTK4 bindings
    CGO_ENABLED=1 go build \
        -ldflags "${_ldflags}" \
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

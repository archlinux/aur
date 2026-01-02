# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui'
pkgver=0.0.6
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
sha256sums=('ffcccb7e470f6307fd3b5ae5a713e7b007508d87b5b19eb9abdb8dea9d67fa2e')

build() {
    cd "${pkgname}-${pkgver}"

    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    # Build metadata
    local _commit="505d2c4a221ed93ba7e01a0418e8e2d5ecf6b325"
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
    install -Dm644 docs/static/examples/histuid.toml "${pkgdir}/usr/share/doc/${pkgname}/histuid.toml.example"
}

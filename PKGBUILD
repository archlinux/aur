# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='histui'
pkgver=0.0.14
pkgrel=1
pkgdesc='Notification history browser and daemon for Linux desktops'
url='https://github.com/jmylchreest/histui'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'alsa-lib')
makedepends=('go' 'git' 'gobject-introspection')
provides=('histui' 'histuid')
conflicts=('histui-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jmylchreest/histui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d755b590c733d96cf092e6bbe87d88b84ffd4fabb856fc5bad6138eea818f21')

build() {
    cd "${pkgname}-${pkgver}"

    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    # Build metadata
    local _commit="174011c8747873b8637948cdc4701e0fd7dbec5b"
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

    # Shell completions - generated from the freshly built native binary
    # so they always match the code being packaged.
    mkdir -p completions
    ./histui completion bash > completions/histui.bash
    ./histui completion zsh  > completions/_histui
    ./histui completion fish > completions/histui.fish
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 histui "${pkgdir}/usr/bin/histui"
    install -Dm755 histuid "${pkgdir}/usr/bin/histuid"
    install -Dm644 contrib/histuid.service "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 contrib/histuid-monitor.service "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 docs/static/examples/histuid.toml "${pkgdir}/usr/share/doc/${pkgname}/histuid.toml.example"

    # Shell completions
    install -Dm644 completions/histui.bash "${pkgdir}/usr/share/bash-completion/completions/histui"
    install -Dm644 completions/_histui "${pkgdir}/usr/share/zsh/site-functions/_histui"
    install -Dm644 completions/histui.fish "${pkgdir}/usr/share/fish/vendor_completions.d/histui.fish"
}

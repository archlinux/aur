# Maintainer: John Mylchreest <jmylchreest@gmail.com>
pkgname=histui-git
pkgver=0.0.14.r33.gade0a13
pkgrel=1
pkgdesc="Notification history browser and daemon for Linux desktops (latest Git main)"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/histui"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'alsa-lib' 'fontconfig')
makedepends=('go' 'git')
options=('!debug')
provides=("histui=${pkgver}" "histuid=${pkgver}")
conflicts=('histui' 'histui-bin')
source=("histui::git+https://github.com/jmylchreest/histui.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/histui"
    # Only release tags: development tags must not make versions go backwards.
    local _version
    if _version=$(git describe --tags --long --match 'v[0-9]*' --exclude '*-*' 2>/dev/null); then
        printf '%s\n' "${_version#v}" | sed 's/-\([0-9]*\)-g/.r\1.g/'
    else
        printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/histui"

    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    local _commit="$(git rev-parse HEAD)"
    local _buildtime="$(date -u -d "@$(git log -1 --format=%ct)" +%Y-%m-%dT%H:%M:%SZ)"
    local _ldflags="-s -w -X main.version=${pkgver} -X main.commit=${_commit} -X main.buildTime=${_buildtime}"

    # histui CLI - pure Go, no CGO needed
    CGO_ENABLED=0 go build \
        -ldflags "${_ldflags}" \
        -o histui ./cmd/histui

    # histuid daemon - CGO-free; GTK4/libadwaita are runtime dependencies
    CGO_ENABLED=0 sh scripts/puregotk/go.sh build \
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
    cd "${srcdir}/histui"

    install -Dm755 histui "${pkgdir}/usr/bin/histui"
    install -Dm755 histuid "${pkgdir}/usr/bin/histuid"
    install -Dm644 contrib/histuid.service "${pkgdir}/usr/lib/systemd/user/histuid.service"
    install -Dm644 contrib/histuid-monitor.service "${pkgdir}/usr/lib/systemd/user/histuid-monitor.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install example config
    install -Dm644 docs/static/examples/histuid.toml "${pkgdir}/usr/share/doc/${pkgname}/histuid.toml.example"

    # Shell completions
    install -Dm644 completions/histui.bash "${pkgdir}/usr/share/bash-completion/completions/histui"
    install -Dm644 completions/_histui "${pkgdir}/usr/share/zsh/site-functions/_histui"
    install -Dm644 completions/histui.fish "${pkgdir}/usr/share/fish/vendor_completions.d/histui.fish"
}

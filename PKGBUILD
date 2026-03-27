# Maintainer: alsogamer <me@alsogamer.com>
pkgname=mpv-manager
pkgver=1.1.0
pkgrel=2
pkgdesc='MPV media player installer and manager with Web UI, TUI, and CLI modes'
arch=('x86_64' 'aarch64')
url='https://gitgud.io/mike/mpv-manager'
license=('MIT')
makedepends=('go')
optdepends=('mpv: media player managed and configured by this tool'
            'celluloid: GTK-based mpv frontend'
            'mpc-qt: Qt-based mpv frontend'
            'ffmpeg: additional media processing support'
            'flatpak: manage Flatpak versions of mpv and Celluloid')
source=("${pkgname}-${pkgver}.tar.gz::https://gitgud.io/mike/mpv-manager/-/archive/v${pkgver}/mpv-manager-v${pkgver}.tar.gz")
sha256sums=('eb584b2fb148e6d2247cc09efae71d78aacee59e4f1b96b9fe97ccd2a633e888')

prepare() {
    cd "${pkgname}-v${pkgver}"
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${pkgname}-v${pkgver}"
    export GOPATH="${srcdir}/gopath"
    go build \
        -trimpath \
        -buildvcs=false \
        -mod=readonly \
        -ldflags "-s -w \
            -X gitgud.io/mike/mpv-manager/pkg/version.CurrentVersion=${pkgver} \
            -X gitgud.io/mike/mpv-manager/pkg/version.BuildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ) \
            -X gitgud.io/mike/mpv-manager/pkg/version.GitCommit=release" \
        -o dist/mpv-manager \
        ./cmd/mpv-manager
}

check() {
    cd "${pkgname}-v${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export HOME="${srcdir}/testhome"
    # pkg/keyring tests require a running user keyring daemon and will
    # prompt to create a new keystore interactively — skip during build
    go test $(go list ./... | grep -v '/pkg/keyring')
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm755 dist/mpv-manager "${pkgdir}/usr/bin/mpv-manager"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

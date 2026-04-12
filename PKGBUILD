# Maintainer: alsogamer <me@alsogamer.com>
pkgname=mpv-manager-git
pkgver=1.2.0.r0.g2e76e96
pkgrel=1
pkgdesc='MPV media player installer and manager with Web UI, TUI, and CLI modes (git)'
arch=('x86_64' 'aarch64')
url='https://gitgud.io/mike/mpv-manager'
license=('MIT')
makedepends=('go' 'git')
provides=('mpv-manager')
conflicts=('mpv-manager')
optdepends=('mpv: media player managed and configured by this tool'
            'celluloid: GTK-based mpv frontend'
            'mpc-qt: Qt-based mpv frontend'
            'ffmpeg: additional media processing support'
            'flatpak: manage Flatpak versions of mpv and Celluloid')
source=("${pkgname}::git+https://gitgud.io/mike/mpv-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${pkgname}"
    export GOPATH="${srcdir}/gopath"
    go build \
        -trimpath \
        -buildvcs=false \
        -mod=readonly \
        -ldflags "-s -w \
            -X gitgud.io/mike/mpv-manager/pkg/version.SelfUpdateDisabled=true \
            -X gitgud.io/mike/mpv-manager/pkg/version.CurrentVersion=${pkgver} \
            -X gitgud.io/mike/mpv-manager/pkg/version.BuildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ) \
            -X gitgud.io/mike/mpv-manager/pkg/version.GitCommit=$(git -C ${srcdir}/${pkgname} rev-parse --short HEAD)" \
        -o dist/mpv-manager \
        ./cmd/mpv-manager
}

package() {
    cd "${pkgname}"
    install -Dm755 dist/mpv-manager "${pkgdir}/usr/bin/mpv-manager"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

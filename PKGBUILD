# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat-bin
pkgver=0.17.4
pkgrel=1
pkgdesc="Modern terminal-based VPN client with Xray-core backend (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=('iproute2' 'nftables' 'libcap' 'systemd')
optdepends=(
    'iptables: legacy firewall backend for TUN mode'
    'polkit: pkexec-based capability setup from the TUI'
    'xray: system Xray-core binary (managed runtime used automatically if absent)'
)
provides=('whoisthat')
conflicts=('whoisthat')
install=whoisthat-bin.install
# Prebuilt static musl binaries; do not strip or split debug symbols.
options=(!strip !debug)
source_x86_64=("whoisthat-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/whoisthat-linux-amd64.tar.gz")
source_aarch64=("whoisthat-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/whoisthat-linux-arm64.tar.gz")
# CI pins the checksums of the published release assets.
sha256sums_x86_64=('2dd1a44201122df8169036d22077bcb211141c37144f782528b7c7bfb1879779')
sha256sums_aarch64=('33d0beea6b47d6e330e9a353e33f2fee5fd69c347b814333af0946b8f02fef9f')

package() {
    local src
    case "$CARCH" in
        x86_64)  src="whoisthat-${pkgver}-linux-amd64.tar.gz" ;;
        aarch64) src="whoisthat-${pkgver}-linux-arm64.tar.gz" ;;
        *) error "unsupported architecture: $CARCH"; exit 1 ;;
    esac

    tar -xzf "${srcdir}/${src}" -C "${srcdir}"
    install -Dm755 "${srcdir}/whoisthat"                 "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 "${srcdir}/whoisthat-core"            "${pkgdir}/usr/bin/whoisthat-core"
    install -Dm644 "${srcdir}/whoisthat.desktop"         "${pkgdir}/usr/share/applications/whoisthat.desktop"
    install -Dm644 "${srcdir}/LICENSE"                   "${pkgdir}/usr/share/licenses/whoisthat/LICENSE"
}

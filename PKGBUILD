# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat-bin
pkgver=0.17.6
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
sha256sums_x86_64=('5c4e5b1dac188a4a22e49ef64c135dc306c2956b4bb1a68e350effc7416d7a8e')
sha256sums_aarch64=('4d39d2932156a372ce70a6831c037ce55d6b3bd73299246a527aace450b09e3f')

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

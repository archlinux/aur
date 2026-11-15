# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat-bin
pkgver=0.19.3
pkgrel=1
pkgdesc="Modern terminal-based VPN client with Xray-core backend (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=('iproute2' 'nftables' 'libcap')
optdepends=(
    'iptables: legacy firewall backend for TUN mode'
    'polkit: pkexec-based capability setup from the TUI'
    'systemd: autostart via user unit and linger'
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
sha256sums_x86_64=('6c41ac00a1e87f4d9439b2c474068b9209df7b6eacabc7bf0bd6d6d52991524f')
sha256sums_aarch64=('9548a05d8d638f70bfce54afb964f7a99c49bd178130f109a59bc61f62384264')

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
    install -Dm755 "${srcdir}/whoisthat-runner"          "${pkgdir}/usr/bin/whoisthat-runner"
    install -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/lib/whoisthat" "${pkgdir}/usr/lib/"
    install -Dm644 "${srcdir}/whoisthat.desktop"         "${pkgdir}/usr/share/applications/whoisthat.desktop"
    install -Dm644 "${srcdir}/whoisthat-url.desktop"     "${pkgdir}/usr/share/applications/whoisthat-url.desktop"
    install -Dm644 "${srcdir}/whoisthat.svg"             "${pkgdir}/usr/share/icons/hicolor/scalable/apps/whoisthat.svg"
    install -Dm644 "${srcdir}/LICENSE"                   "${pkgdir}/usr/share/licenses/whoisthat/LICENSE"

    "${pkgdir}/usr/bin/whoisthat" completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/whoisthat"
    "${pkgdir}/usr/bin/whoisthat" completions zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_whoisthat"
    "${pkgdir}/usr/bin/whoisthat" completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/whoisthat.fish"
    "${pkgdir}/usr/bin/whoisthat" man             | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man1/whoisthat.1"
}

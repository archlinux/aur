# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat
pkgver=0.14.3
pkgrel=1
pkgdesc="Modern terminal-based VPN client with Xray-core backend"
arch=('x86_64' 'aarch64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=('iproute2' 'nftables' 'libcap' 'systemd')
makedepends=('rust' 'go')
optdepends=(
    'iptables: legacy firewall backend for TUN mode'
    'polkit: pkexec-based capability setup from the TUI'
    'xray: system Xray-core binary (managed runtime used automatically if absent)'
)
install=whoisthat.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kvunoff/whoisthat/archive/refs/tags/v${pkgver}.tar.gz")
# The "Publish to AUR" workflow pins the real released-tag digest.
sha256sums=('024a83de4ba683face2bae5b20794dfb6d9c6aaaa98ec5f715e20144636a00c9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd core/core
    go build -o whoisthat-core
    cd ../..

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/whoisthat "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 core/core/whoisthat-core  "${pkgdir}/usr/bin/whoisthat-core"
    install -Dm644 pkg/whoisthat.desktop     "${pkgdir}/usr/share/applications/whoisthat.desktop"
}

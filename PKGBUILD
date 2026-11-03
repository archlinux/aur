# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat
pkgver=0.18.0
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
# The prebuilt package installs the same files; never allow both.
conflicts=('whoisthat-bin')
install=whoisthat.install
# ring (pulled in by rustls/ureq) ships precompiled assembly archives. Arch's
# makepkg injects -flto=auto into CFLAGS/CXXFLAGS/LDFLAGS for the `lto` option;
# the ring objects then lose their ring_core_* symbols at the final Rust link.
# Disable makepkg LTO for this package (Cargo itself is not LTO-enabled).
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kvunoff/whoisthat/archive/refs/tags/v${pkgver}.tar.gz")
# The "Publish to AUR" workflow pins the real released-tag digest.
sha256sums=('0500c1a3ce88e3278e7f59252e9c17c1180d6ae5a92636a6b5bf420b6b25b43a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd core/core
    go build -trimpath -o whoisthat-core
    cd ../..

    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/whoisthat "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 core/core/whoisthat-core  "${pkgdir}/usr/bin/whoisthat-core"
    install -Dm644 pkg/whoisthat.desktop     "${pkgdir}/usr/share/applications/whoisthat.desktop"
    install -Dm644 pkg/whoisthat-url.desktop "${pkgdir}/usr/share/applications/whoisthat-url.desktop"
    install -Dm644 docs/public/logo.svg      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/whoisthat.svg"
}

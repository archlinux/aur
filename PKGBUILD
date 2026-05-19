# Maintainer: eDEX-OS <edex-de@github.com>
pkgname=edex-de
pkgver=2.0.7
pkgrel=1
pkgdesc="eDEX-DE — A sci-fi Wayland desktop environment built in pure Rust"
arch=('x86_64')
url="https://github.com/eDEX-OS/eDEX-DE"
license=('GPL3')
depends=(
    'libxkbcommon'
    'libinput'
    'libseat.so'
    'mesa'
    'wayland'
    'systemd-libs'
    'libdrm'
    'vulkan-icd-loader'
    'dbus'
)
makedepends=(
    'rust'
    'cargo'
    'git'
    'pixman'
    'vulkan-headers'
    'pkgconf'
)
optdepends=(
    'tailscale: VPN support'
    'wireguard-tools: WireGuard VPN support'
    'tor: Tor anonymization support'
    'fprintd: Fingerprint authentication'
    'pipewire: Audio support'
    'networkmanager: Network management'
    'bluez: Bluetooth support'
    'xdg-desktop-portal: Portal support'
)
install=edex-de.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/eDEX-OS/eDEX-DE/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('45f47bf0c262d78a063f85a4b3ebd22a1101bdc335d210ba5762da8bf2dc313d')

build() {
    cd "eDEX-DE-${pkgver}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked -p edex-de
}

package() {
    cd "eDEX-DE-${pkgver}"

    install -Dm755 "target/release/edex-de" \
        "$pkgdir/usr/bin/edex-de"

    install -Dm644 "packaging/session/edex-de.desktop" \
        "$pkgdir/usr/share/wayland-sessions/edex-de.desktop"

    install -Dm755 "packaging/session/edex-de-startup.sh" \
        "$pkgdir/usr/lib/edex-de/edex-de-startup.sh"

    install -Dm644 "packaging/session/edex-de-portals.conf" \
        "$pkgdir/usr/share/xdg-desktop-portal/edex-de-portals.conf"

    install -dm755 "$pkgdir/usr/share/edex-de/themes"
    install -Dm644 themes/*.toml \
        "$pkgdir/usr/share/edex-de/themes/"

    install -Dm644 "README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

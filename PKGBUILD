# Maintainer: eDEX-DE Contributors <https://github.com/eDEX-OS/eDEX-DE>
pkgname=edex-de
pkgver=1.2.0
pkgrel=1
pkgdesc="Sci-fi themed Wayland Desktop Environment built on Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/eDEX-OS/eDEX-DE"
license=('GPL-3.0')
depends=(
    # Core Tauri/WebKit runtime
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'openssl'
    # Wayland compositor (session base)
    'hyprland'
    'xdg-desktop-portal-hyprland'
    'xdg-desktop-portal'
    # Audio stack
    'pipewire'
    'wireplumber'
    'pipewire-pulse'
    # Clipboard
    'wl-clipboard'
    # Notification daemon
    'mako'
    # Idle / screen-lock daemon
    'swayidle'
    # Polkit agent (privilege dialogs)
    'polkit-gnome'
    # Used in Super+Q keybind to check window class
    'jq'
)
optdepends=(
    'cliphist: clipboard history'
    'networkmanager: network management panel'
    'fprintd: fingerprint authentication'
    'bluez: bluetooth support'
    'bluez-utils: bluetooth CLI tools'
    'tailscale: Tailscale VPN integration'
    'tor: Tor anonymisation'
    'foot: default terminal emulator'
    'kitty: alternative terminal emulator'
    'swaylock: screen locking'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'pkg-config'
    'openssl'
    'libsoup'
    'webkit2gtk-4.1'
)
provides=('edex-de')
conflicts=('edex-de-git')

# Source: release CI uploads versioned source tarballs.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eDEX-OS/eDEX-DE/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f12ac7b367e67a4a26c6c9c44d23e7e9540741434c32be9984c867c37034f716')

prepare() {
    cd "eDEX-DE-${pkgver}"
    npm install
}

build() {
    cd "eDEX-DE-${pkgver}"
    export CARGO_INCREMENTAL=0
    npm run tauri -- build --no-bundle
}

package() {
    cd "eDEX-DE-${pkgver}"

    # Main binary
    install -Dm755 "target/release/edex-de" "${pkgdir}/usr/bin/edex-de"

    # Session startup script (makes eDEX-DE selectable at the login screen)
    install -Dm755 "packaging/edex-de-session" "${pkgdir}/usr/bin/edex-de-session"

    # Wayland session entry (login screen session list)
    install -Dm644 "packaging/edex-de-session.desktop" \
        "${pkgdir}/usr/share/wayland-sessions/edex-de.desktop"

    # Application entry (app launchers / .desktop search)
    install -Dm644 "packaging/edex-de.desktop" \
        "${pkgdir}/usr/share/applications/edex-de.desktop"

    # Bundled Hyprland config for the eDEX-DE session
    install -Dm644 "packaging/edex-de-hyprland.conf" \
        "${pkgdir}/etc/xdg/edex-de/hyprland.conf"

    # Icons
    for size in 32x32 128x128; do
        install -Dm644 "src-tauri/icons/${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/edex-de.png"
    done

    if [[ -f LICENSE ]]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

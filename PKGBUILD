# Maintainer: xander1421 <alexpruteanu@hotmail.com>
pkgname=spotify-tray-wayland-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="Native Wayland/Hyprland system tray for Spotify with scroll and middle-click controls"
arch=('x86_64' 'aarch64')
url="https://github.com/xander1421/spotify-tray-wayland"
license=('GPL3')
depends=('dbus')
optdepends=(
    'spotify-launcher: official Spotify launcher'
    'spotify: Spotify client (AUR)'
    'hyprland: for window show/hide functionality'
    'jq: check for conflicting Hyprland shortcuts during setup'
)
provides=('spotify-tray-wayland')
conflicts=('spotify-tray-wayland' 'spotify-tray-wayland-git')
options=('!debug')
install="${pkgname}.install"
source=('spotify-tray-setup')
sha256sums=('1885727529522403aa41025eb6bb706d3f1ec8d7b420afc0be943ec771971884')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/xander1421/spotify-tray-wayland/releases/download/v${pkgver}/spotify-tray-wayland-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/xander1421/spotify-tray-wayland/releases/download/v${pkgver}/spotify-tray-wayland-linux-arm64")
sha256sums_x86_64=('3c0ae80775f9dd75db949d535b780de7d5f92916e5c8f1ce7dd95292cd4ea261')
sha256sums_aarch64=('2302e73b451879d3c48460b00e75d7c932802b3123d09dd0ccbd33dff18852f8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/spotify-tray-wayland"

    # Create launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/spotify-tray-launcher" << 'EOF'
#!/usr/bin/env bash
# Spotify Launcher - starts tray with Spotify
if ! pgrep -u "$(id -u)" -f '^([^ ]*/)?spotify-tray-wayland$' >/dev/null; then
    /usr/bin/spotify-tray-wayland &
fi
exec spotify "$@"
EOF

    install -Dm755 "${srcdir}/spotify-tray-setup" "${pkgdir}/usr/bin/spotify-tray-setup"
}

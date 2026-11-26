# Maintainer: xander1421 <alexpruteanu@hotmail.com>
pkgname=spotify-tray-wayland-bin
pkgver=1.1.5
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
sha256sums_x86_64=('8f05590f1c808feb8528b81ae56feda8d228aace3058e13fd87461951cd2d624')
sha256sums_aarch64=('8a57a12c9a7f510bc2c48e937df3284872775ac55a57157e9ce90704b8ff69aa')

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

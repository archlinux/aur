# Maintainer: xander1421 <alexpruteanu@hotmail.com>
pkgname=spotify-tray-wayland-git
pkgver=r53.6fbc589
pkgrel=1
pkgdesc="Native Wayland/Hyprland system tray for Spotify with scroll and middle-click controls"
arch=('x86_64' 'aarch64')
url="https://github.com/xander1421/spotify-tray-wayland"
license=('GPL3')
depends=('dbus')
makedepends=('go' 'git')
optdepends=(
    'spotify-launcher: official Spotify launcher'
    'spotify: Spotify client (AUR)'
    'hyprland: for window show/hide functionality'
    'jq: check for conflicting Hyprland shortcuts during setup'
)
provides=('spotify-tray-wayland')
conflicts=('spotify-tray-wayland' 'spotify-tray-wayland-bin')
options=('!debug')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/xander1421/spotify-tray-wayland.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/spotify-tray-wayland"
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w" -o spotify-tray-wayland .
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "spotify-tray-wayland/spotify-tray-wayland" "${pkgdir}/usr/bin/spotify-tray-wayland"

    # Create launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/spotify-tray-launcher" << 'EOF'
#!/usr/bin/env bash
# Spotify Launcher - starts tray with Spotify
if ! pgrep -u "$(id -u)" -f '^([^ ]*/)?spotify-tray-wayland$' >/dev/null; then
    /usr/bin/spotify-tray-wayland &
fi
exec spotify "$@"
EOF

    install -Dm755 "aur/spotify-tray-wayland-bin/spotify-tray-setup" "${pkgdir}/usr/bin/spotify-tray-setup"
}

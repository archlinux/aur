# Maintainer: Sergio Torres Soldado
pkgname=kayzeer-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Keyboard-driven screen navigation for Linux (Wayland)"
arch=('x86_64')
url="https://github.com/serjster/KayZeer"
license=('custom:proprietary')
depends=(
    'gstreamer'
    'gst-plugins-base-libs'
    'mesa'
    'dbus'
    'libxkbcommon'
    'wayland'
)
optdepends=(
    'libappindicator-gtk3: system tray support on some DEs'
)
conflicts=('kayzeer')
provides=('kayzeer')
install=kayzeer-bin.install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/serjster/KayZeer/releases/download/v${pkgver}/KayZeer-${pkgver}-linux-x86_64.tar.gz"
    'kayzeer.service'
)
sha256sums=('SKIP' 'SKIP')

package() {
    cd "${srcdir}/KayZeer-${pkgver}-linux-x86_64"

    # Binary
    install -Dm755 kayzeer "${pkgdir}/usr/bin/kayzeer"

    # Systemd user service
    install -Dm644 "${srcdir}/kayzeer.service" "${pkgdir}/usr/lib/systemd/user/kayzeer.service"

    # Desktop entry (for application launchers)
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/kayzeer.desktop" <<EOF
[Desktop Entry]
Name=KayZeer
Comment=Keyboard-driven screen navigation
Exec=/usr/bin/kayzeer
Type=Application
Categories=Utility;Accessibility;
NoDisplay=true
EOF

    # udev rule: grant input group access (needed for evdev grab)
    install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
    cat > "${pkgdir}/usr/lib/udev/rules.d/90-kayzeer-input.rules" <<EOF
# Allow input group members to access input devices (for KayZeer evdev grab)
KERNEL=="event*", SUBSYSTEM=="input", GROUP="input", MODE="0660"
EOF
}

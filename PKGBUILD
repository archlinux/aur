# Maintainer: Xuruh <xuruh@fluxer.world>
pkgname=fluxer-world-bin
pkgver=1.0.32
pkgrel=1
pkgdesc="Fluxer World desktop client — open-source chat, voice, and community platform"
arch=('x86_64')
url="https://fluxer.world"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libdrm' 'mesa')
optdepends=(
    'libappindicator-gtk3: system tray support'
    'xdg-utils: protocol handler registration'
)
provides=('fluxer-world')
conflicts=('fluxer-world')
options=('!strip' '!debug')
source=("fluxer-world-${pkgver}-linux-x64.tar.gz::https://github.com/fluxerworld/fluxerworld/releases/download/v${pkgver}/Fluxer.World-${pkgver}-linux-x64.tar.gz")
sha256sums=('275d5730d9b64418fa89c5c14ceeca0883fe644b459d582e5688df9dc00bb926')

package() {
    # Install app files (tar.gz extracts to "Fluxer World-${pkgver}-linux-x64/")
    install -dm 755 "${pkgdir}/opt/fluxer-world"
    cp -r "${srcdir}/Fluxer World-${pkgver}-linux-x64/"* "${pkgdir}/opt/fluxer-world/"

    # Make the main binary executable
    chmod 755 "${pkgdir}/opt/fluxer-world/fluxer-world"
    # Chrome sandbox not needed with --no-sandbox
    chmod 4755 "${pkgdir}/opt/fluxer-world/chrome-sandbox" 2>/dev/null || true

    # Create wrapper script
    install -dm 755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/fluxer-world" <<'EOF'
#!/bin/sh
export GDK_BACKEND=wayland,x11
exec /opt/fluxer-world/fluxer-world \
  --no-sandbox \
  --enable-features=UseOzonePlatform,WaylandWindowDecorations \
  --ozone-platform-hint=auto \
  --class=org.fluxer.World \
  --wayland-app-id=org.fluxer.World \
  "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/fluxer-world"

    # Desktop entry
    install -Dm 644 /dev/stdin "${pkgdir}/usr/share/applications/org.fluxer.World.desktop" <<EOF
[Desktop Entry]
Name=Fluxer World
Comment=Fluxer World desktop client
Exec=fluxer-world %U
Icon=org.fluxer.World
Terminal=false
Type=Application
Categories=Network;InstantMessaging;Chat;
StartupWMClass=Fluxer World
MimeType=x-scheme-handler/fluxerworld;
EOF
    # KDE Wayland uses the window's app_id ("Fluxer World") to find the desktop file
    ln -s org.fluxer.World.desktop "${pkgdir}/usr/share/applications/Fluxer World.desktop"

    # Icons
    local icon_src="${pkgdir}/opt/fluxer-world/resources/assets/icons"
    if [ -f "${icon_src}/icon.png" ]; then
        for size in 16 32 48 64 128 256 512; do
            install -Dm 644 "${icon_src}/icon.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/org.fluxer.World.png"
        done
    fi
}

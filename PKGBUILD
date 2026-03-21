# Maintainer: Xuruh <xuruh@tuta.io>
pkgname=fluxer-world-bin
pkgver=1.0.0
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
source=("https://github.com/fluxerworld/fluxerworld/releases/download/v${pkgver}/Fluxer.World-${pkgver}-linux-x64.tar.gz")
sha256sums=('a0d64bb5442f510c5b518934a2d234ab2b545f66eafa22cc08110c6216cffbb6')

package() {
    # Install app files
    install -dm 755 "${pkgdir}/opt/fluxer-world"
    cp -r "${srcdir}/"* "${pkgdir}/opt/fluxer-world/"
    # Remove the tar.gz packaging leftovers if present
    rm -f "${pkgdir}/opt/fluxer-world/"*.tar.gz

    # Make the main binary executable
    chmod 755 "${pkgdir}/opt/fluxer-world/fluxer-desktop"
    # Chrome sandbox not needed with --no-sandbox
    chmod 4755 "${pkgdir}/opt/fluxer-world/chrome-sandbox" 2>/dev/null || true

    # Create wrapper script
    install -dm 755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/fluxer-world" <<'EOF'
#!/bin/sh
exec /opt/fluxer-world/fluxer-desktop \
  --no-sandbox \
  --enable-features=UseOzonePlatform,WaylandWindowDecorations \
  --ozone-platform-hint=auto \
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
StartupWMClass=fluxer-world
MimeType=x-scheme-handler/fluxerworld;
EOF

    # Icons
    local icon_src="${pkgdir}/opt/fluxer-world/resources/assets/icons"
    if [ -f "${icon_src}/icon.png" ]; then
        for size in 16 32 48 64 128 256 512; do
            install -Dm 644 "${icon_src}/icon.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/org.fluxer.World.png"
        done
    fi
}

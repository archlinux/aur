# Maintainer: stev3m <https://gitlab.com/vibesmiths>
pkgname=heatsync-bin
pkgver=1.0.70
pkgrel=1
pkgdesc="Real-time system monitor with per-component gauges, sparklines, and vendor-aware hardware labels"
arch=('x86_64')
url="https://gitlab.com/vibesmiths/HeatSync"
license=('MIT')
depends=('fuse2')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring'
    'rocm-smi-lib: AMD GPU monitoring via ROCm'
)
provides=('heatsync')
conflicts=('heatsync')
options=('!strip')
source=(
    "HeatSync-${pkgver}.AppImage::https://gitlab.com/vibesmiths/HeatSync/-/releases/v${pkgver}/downloads/HeatSync.AppImage"
    "icon.png::https://gitlab.com/vibesmiths/HeatSync/-/raw/main/assets/icon.png"
)
sha256sums=(
    '3acd169e745f7c5f31f63c5873ceb0db67da5049d8c986324c6749ffb1b3d021'
    '5fd30558f5018d4acca05659f38830c5bd47bf384c8df27025284b359d5fce4a'
)
noextract=("HeatSync-${pkgver}.AppImage")

package() {
    # Install AppImage
    install -Dm755 "HeatSync-${pkgver}.AppImage" "${pkgdir}/opt/heatsync/HeatSync.AppImage"

    # Wrapper script so `heatsync` works from the terminal
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/heatsync" << 'EOF'
#!/bin/sh
exec /opt/heatsync/HeatSync.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/heatsync"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/heatsync.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=HeatSync
Comment=Real-time system monitor
Exec=heatsync
Icon=heatsync
Categories=System;Monitor;
Terminal=false
StartupWMClass=heatsync
EOF

    # Icon
    install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/heatsync.png"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License — Copyright (c) 2025 crockednloaded
See https://gitlab.com/vibesmiths/HeatSync/-/blob/main/LICENSE for full text.
EOF
}

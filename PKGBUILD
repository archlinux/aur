# Maintainer: crockednloaded <https://github.com/crockednloaded>
pkgname=heatsync-bin
pkgver=1.0.51
pkgrel=1
pkgdesc="Real-time system monitor with per-component gauges, sparklines, and vendor-aware hardware labels"
arch=('x86_64')
url="https://github.com/crockednloaded/HeatSync"
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
    "HeatSync-${pkgver}.AppImage::https://github.com/crockednloaded/HeatSync/releases/download/v${pkgver}/HeatSync.AppImage"
    "icon.png::https://raw.githubusercontent.com/crockednloaded/HeatSync/main/assets/icon.png"
)
sha256sums=(
    '848560acb549c7f20f8fe20807b1ffcf99d9a0590f94362854b4f3add54f88a6'
    '6be6c05cda1330bb0a4cfa8428a769fa891e88a71e2b78288e67071df37fa449'
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
See https://github.com/crockednloaded/HeatSync/blob/main/LICENSE for full text.
EOF
}

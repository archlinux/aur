# Maintainer: Max Trewhitt <max@trewhitt.au>
pkgname=devwp-bin
pkgver=0.0.28
pkgrel=1
pkgdesc="An Electron-based desktop application for managing local WordPress development sites"
arch=('x86_64')
url="https://github.com/SpiZeak/DevWP"
license=('custom')
depends=('docker' 'docker-compose' 'gtk3' 'nss' 'alsa-lib')
optdepends=(
    'docker-buildx: For building custom Docker images'
    'git: For version control integration'
)
provides=('devwp')
conflicts=('devwp')
options=('!strip')
install=devwp-bin.install
source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/devwp-${pkgver}.AppImage"
    "${pkgname}-${pkgver}-compose.yml::${url}/raw/v${pkgver}/compose.yml"
    "${pkgname}-${pkgver}-config.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0f3449e57ed76f1062f18efb40237926ceef73c468257e0f04bbb90ebe73a662'
    '88ee24e899eb9ca940b6ec0aeb22b11a130a5e6b6c848065b9232916ef0d01a6'
    'SKIP'
)
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Extract the config files from the source tarball
    tar -xzf "${pkgname}-${pkgver}-config.tar.gz" "DevWP-${pkgver}/config" --strip-components=1
}

package() {
    # Install main application files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"

    # Fix permissions on resources directory and contents
    # The AppImage extracts with restrictive permissions that prevent normal users from running the app
    chmod 755 "${pkgdir}/opt/${pkgname}/resources"
    if [ -d "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked" ]; then
        find "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked" -type d -exec chmod 755 {} \;
        find "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked" -type f -exec chmod 644 {} \;
    fi

    # Install Docker Compose configuration
    install -Dm644 "${pkgname}-${pkgver}-compose.yml" \
        "${pkgdir}/opt/${pkgname}/compose.yml"

    # Install config directory and all subdirectories
    install -dm755 "${pkgdir}/opt/${pkgname}/config"
    cp -r config/* "${pkgdir}/opt/${pkgname}/config/"

    # Ensure dynamically generated nginx configs can be written by the runtime user
    chmod 777 "${pkgdir}/opt/${pkgname}/config/nginx/sites-enabled"

    # Ensure certs directory exists (Docker certs service will populate it)
    # Must be writable by Docker containers
    install -dm777 "${pkgdir}/opt/${pkgname}/config/certs"

    # Create wrapper script with necessary Electron flags
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/devwp" << 'EOF'
#!/bin/bash
# DevWP needs to run from its installation directory to find compose.yml and config files
export APPDIR=/opt/devwp-bin
cd "$APPDIR" || exit 1
exec "$APPDIR/DevWP" --no-sandbox "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/devwp"

    # Install desktop file
    # Try to find desktop file in various locations
    local desktop_file=""
    if [ -f "squashfs-root/devwp.desktop" ]; then
        desktop_file="squashfs-root/devwp.desktop"
    elif [ -f "squashfs-root/usr/share/applications/devwp.desktop" ]; then
        desktop_file="squashfs-root/usr/share/applications/devwp.desktop"
    else
        # Create desktop file if it doesn't exist
        install -dm755 "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/devwp.desktop" << 'DESKTOPEOF'
[Desktop Entry]
Name=DevWP
Comment=Local WordPress development environment manager
Exec=/usr/bin/devwp %U
Terminal=false
Type=Application
Icon=devwp
StartupWMClass=DevWP
Categories=Development;Utility;
DESKTOPEOF
    fi

    # Install desktop file if found
    if [ -n "$desktop_file" ]; then
        install -Dm644 "$desktop_file" \
            "${pkgdir}/usr/share/applications/devwp.desktop"
        # Fix Exec path in desktop file
        sed -i 's|Exec=AppRun|Exec=/usr/bin/devwp|g' \
            "${pkgdir}/usr/share/applications/devwp.desktop"
    fi

    # Install icon - try multiple possible locations
    local icon_installed=false

    # Try standard hicolor locations
    for size in 16 32 48 64 128 256 512; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/devwp.png"
            icon_installed=true
        fi
    done

    # Try to find icon in other common locations if not found
    if [ "$icon_installed" = false ]; then
        # Look for any .png file that might be the icon
        local icon_file=$(find squashfs-root -name "*.png" -type f | head -1)
        if [ -n "$icon_file" ]; then
            install -Dm644 "$icon_file" \
                "${pkgdir}/usr/share/pixmaps/devwp.png"
        fi
    fi

    # Install license if available
    if [ -f "squashfs-root/LICENSE" ]; then
        install -Dm644 squashfs-root/LICENSE \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f "squashfs-root/LICENSE.txt" ]; then
        install -Dm644 squashfs-root/LICENSE.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

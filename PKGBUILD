# Maintainer: Stao App <support@stao.app>
pkgname=stao-bin
# pkgver uses underscore instead of plus (AUR requirement)
# e.g., 1.2.0+5 becomes 1.2.0_5
pkgver=1.4.0_7
pkgrel=1
pkgdesc="Standing desk reminder app - track your standing and sitting time"
arch=('x86_64')
url="https://stao.app"
license=('custom')
depends=(
    'gtk3'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'libayatana-appindicator'
)
optdepends=(
    'libnotify: for desktop notifications'
)
provides=('stao')
conflicts=('stao')
options=('!strip')

# Version components:
# _basever: version without build number (used in R2 folder path)
# _fullver: version with build number using + (used in filename)
_basever="${pkgver%_*}"
_fullver="${pkgver/_/+}"
_appimage_name="stao-${_fullver}-linux.AppImage"

source=("${_appimage_name}::https://downloads.stao.app/releases/v${_basever}/${_appimage_name}"
        "terms-of-service.html::https://www.stao.app/terms")
sha256sums=('3d2de8e35ce64b454c67ba09452d487017baf9d8e42eac6b177024693ec946b2'
            'SKIP')

package() {
    cd "${srcdir}"

    # Make AppImage executable and extract it
    chmod +x "${_appimage_name}"
    "./${_appimage_name}" --appimage-extract

    # Install to /opt/stao
    install -dm755 "${pkgdir}/opt/stao"
    cp -r squashfs-root/* "${pkgdir}/opt/stao/"

    # Fix permissions
    chmod 755 "${pkgdir}/opt/stao/stao"
    find "${pkgdir}/opt/stao" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/stao" -type f -name "*.so*" -exec chmod 755 {} \;

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/stao" << 'EOF'
#!/bin/bash
exec /opt/stao/stao "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/stao"

    # Install desktop file
    install -Dm644 "${pkgdir}/opt/stao/stao.desktop" \
        "${pkgdir}/usr/share/applications/stao.desktop"

    # Fix desktop file paths
    sed -i 's|Exec=.*|Exec=/usr/bin/stao|' \
        "${pkgdir}/usr/share/applications/stao.desktop"
    sed -i 's|Icon=.*|Icon=stao|' \
        "${pkgdir}/usr/share/applications/stao.desktop"

    # Install icons
    for size in 16 32 48 64 128 256 512; do
        if [ -f "${pkgdir}/opt/stao/data/flutter_assets/assets/icons/app_icon.png" ]; then
            install -Dm644 "${pkgdir}/opt/stao/data/flutter_assets/assets/icons/app_icon.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stao.png"
        fi
    done

    # Also check for icon in standard AppImage location
    if [ -f "${pkgdir}/opt/stao/stao.png" ]; then
        for size in 16 32 48 64 128 256 512; do
            install -Dm644 "${pkgdir}/opt/stao/stao.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stao.png"
        done
    fi

    # Install license/terms of service
    install -Dm644 "${srcdir}/terms-of-service.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/terms-of-service.html"
}

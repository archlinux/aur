# Maintainer: Crosery <luoxi2024@gmail.com>

pkgname=pencil-dev-appimage
pkgver=1.1.38
pkgrel=1
pkgdesc="Design on canvas. Land in code. Increases engineering speed by bringing designing directly into your IDE. (AppImage)"
arch=('x86_64')
url="https://pencil.dev"
license=('custom')
provides=('pencil-dev')
conflicts=('pencil-dev' 'pencil-dev-bin')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
install="${pkgname}.install"
options=('!strip' '!debug')
source=("Pencil-linux-x86_64-${pkgver}.AppImage::https://www.pencil.dev/download/Pencil-linux-x86_64.AppImage"
        "LICENSE"
        "${pkgname}.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
noextract=("Pencil-linux-x86_64-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/Pencil-linux-x86_64-${pkgver}.AppImage"
    "${srcdir}/Pencil-linux-x86_64-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/Pencil-linux-x86_64-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/pencil-dev.AppImage"

    # Create launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/pencil-dev" << 'LAUNCHER'
#!/bin/bash
exec /opt/pencil-dev-appimage/pencil-dev.AppImage --no-sandbox "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/pencil-dev"

    # Install desktop entry from extracted AppImage
    if [ -f "${srcdir}/squashfs-root/pencil.desktop" ]; then
        install -Dm644 "${srcdir}/squashfs-root/pencil.desktop" \
            "${pkgdir}/usr/share/applications/pencil-dev.desktop"
        # Fix desktop entry
        sed -i 's|^Exec=.*|Exec=pencil-dev %U|' \
            "${pkgdir}/usr/share/applications/pencil-dev.desktop"
        sed -i 's|^Name=.*|Name=Pencil|' \
            "${pkgdir}/usr/share/applications/pencil-dev.desktop"
    else
        # Fallback desktop entry
        install -d "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/pencil-dev.desktop" << EOF
[Desktop Entry]
Name=Pencil
Comment=Design on canvas. Land in code.
Exec=pencil-dev %U
Icon=pencil-dev
Type=Application
Categories=Development;Graphics;
MimeType=x-scheme-handler/pencil;
EOF
        chmod 644 "${pkgdir}/usr/share/applications/pencil-dev.desktop"
    fi

    # Install icons from extracted AppImage
    for size in 16 32 48 64 128 256 512; do
        icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/pencil.png"
        if [ -f "${icon}" ]; then
            install -Dm644 "${icon}" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/pencil-dev.png"
        fi
    done

    # Fallback: use any .png found in squashfs-root
    if [ ! -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pencil-dev.png" ]; then
        for icon in "${srcdir}"/squashfs-root/*.png; do
            if [ -f "${icon}" ]; then
                install -Dm644 "${icon}" \
                    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pencil-dev.png"
                break
            fi
        done
    fi

    # Install MCP server to a stable path (AppImage mount point changes on each launch)
    if [ -f "${srcdir}/squashfs-root/resources/app.asar.unpacked/out/mcp-server-linux-x64" ]; then
        install -Dm755 "${srcdir}/squashfs-root/resources/app.asar.unpacked/out/mcp-server-linux-x64" \
            "${pkgdir}/opt/${pkgname}/mcp-server"
    fi

    # Install license
    if [ -f "${srcdir}/LICENSE" ]; then
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}


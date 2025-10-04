# Maintainer: Dustin Pilgrim <your-email@example.com>
pkgname=claw
pkgver=1.0.0
pkgrel=1
pkgdesc="Crustacean powered clipboard manager for X11 & Wayland"
arch=('x86_64')
url="https://github.com/saltnpepper97/claw"
license=('MIT')
depends=('fuse2')
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/saltnpepper97/claw/releases/download/v${pkgver}/claw_${pkgver}_amd64.AppImage")
sha256sums=('4b5f8ffd181e8c09c3afe13cadee2e963b7bfff40f553d6964f4dc65dc71ec72')  # Replace with actual SHA256 after first build
noextract=("${pkgname}-${pkgver}.AppImage")
options=(!strip)


prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the extracted AppImage contents
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
exec /opt/${pkgname}/AppRun "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Fix Exec path in desktop file
    sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname}|g" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install icon
    if [ -f "${srcdir}/squashfs-root/${pkgname}.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/${pkgname}.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi
    
    # Install license if available
    if [ -f "${srcdir}/squashfs-root/LICENSE" ]; then
        install -Dm644 "${srcdir}/squashfs-root/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}


# Maintainer: Jason Summer <your-email@example.com>
pkgname=deepin-wine-quark
pkgver=1.0.0
pkgrel=1
pkgdesc="Deepin Wine Quark Browser (夸克浏览器) - Standalone portable browser packaged as AppImage"
arch=('x86_64')
url="https://gitlab.com/Jason-summer/deepin-wine-quark"
license=('custom')
depends=()
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")

source=("${pkgname}-${pkgver}.AppImage::https://gitlab.com/api/v4/projects/80304414/packages/generic/quark-browser/v${pkgver}/Quark-Browser-x86_64.AppImage")

sha256sums=('28035a1970c0195ee076b7c5c09568db387e0f7ac8cfb8f3f08a9526f5a920d2')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    
    # Extract desktop file and icon from AppImage
    cd "${srcdir}"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1 || true
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file
    if [ -f "${srcdir}/squashfs-root/quark-browser.desktop" ]; then
        install -Dm644 "${srcdir}/squashfs-root/quark-browser.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        # Update desktop file Exec path
        sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname}|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        sed -i "s|Icon=.*|Icon=${pkgname}|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        sed -i "s|Name=.*|Name=Quark Browser|g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    fi
    
    # Install icon
    if [ -f "${srcdir}/squashfs-root/quark-browser.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/quark-browser.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    fi
    
    # Install license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Deepin Wine Quark Browser AppImage

This is a repackaging of Quark Browser using Deepin Wine.
- Quark Browser is property of UCWeb/Alibaba
- Deepin Wine is property of Deepin/Linux Deepin

This project is for educational and convenience purposes only.
EOF
}

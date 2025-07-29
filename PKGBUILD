# Maintainer: Steve Seguin <steve@seguin.email>

pkgname=socialstreamninja
pkgver=0.3.43
pkgrel=1
pkgdesc="Standalone version of Social Stream Ninja - Electron-based application for capturing social media streams"
arch=('x86_64')
url="https://github.com/steveseguin/ssn_app"
license=('GPL3')
depends=('fuse2' 'gtk3' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/steveseguin/ssn_app/releases/download/v${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage"
        "socialstreamninja.desktop")
sha256sums=('SKIP'
            'SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")
options=('!strip')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Extract icon from AppImage
    cd "${srcdir}"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract socialstreamninja.png >/dev/null 2>&1 || \
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract usr/share/icons/hicolor/256x256/apps/socialstreamninja.png >/dev/null 2>&1 || \
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract socialstream.png >/dev/null 2>&1
    
    # Install icon
    if [ -f "squashfs-root/socialstreamninja.png" ]; then
        install -Dm644 "squashfs-root/socialstreamninja.png" "${pkgdir}/usr/share/pixmaps/socialstreamninja.png"
    elif [ -f "squashfs-root/usr/share/icons/hicolor/256x256/apps/socialstreamninja.png" ]; then
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/socialstreamninja.png" "${pkgdir}/usr/share/pixmaps/socialstreamninja.png"
    elif [ -f "squashfs-root/socialstream.png" ]; then
        install -Dm644 "squashfs-root/socialstream.png" "${pkgdir}/usr/share/pixmaps/socialstreamninja.png"
    fi
    
    # Install desktop file
    install -Dm644 "${srcdir}/socialstreamninja.desktop" "${pkgdir}/usr/share/applications/socialstreamninja.desktop"
    
    # Create executable symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
    
    # Clean up
    rm -rf "${srcdir}/squashfs-root"
}
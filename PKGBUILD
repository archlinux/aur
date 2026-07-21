# Maintainer: Arthur <arthursimao567@gmail.com>
# Note: This PKGBUILD was created with AI assistance
pkgname=owl-client
pkgver=3.5.21
pkgrel=1
pkgdesc="Owl Client - Gaming client launcher"
arch=('x86_64')
url="https://owlclient.com.br/"
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://cdn.owlclient.com.br/launcher/${pkgver}/OwlClient-${pkgver}.AppImage")
sha256sums=('SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
    cd "${srcdir}"
    
    # Install the AppImage
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Install icon
    install -Dm644 squashfs-root/owlclient.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Create desktop file
    cat > "${srcdir}/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Owl Client
Comment=Owl Client Launcher
Exec=/opt/${pkgname}/${pkgname}.AppImage
Icon=${pkgname}
Terminal=false
Categories=Game;Utility;
EOF
    
    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Create a symlink in /usr/bin for easy launching
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

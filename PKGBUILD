# Maintainer: Ackerman
pkgname=rootchat
_pkgname=rootchat
pkgver=0.9.88
pkgrel=1
pkgdesc="A community platform combining chat with task management, raid planning, and customizable apps"
arch=('x86_64' 'aarch64')
url="https://www.rootapp.com"
license=('custom')

# Dependencies
depends=('zlib' 'gcc-libs' 'glibc' 'fuse2' 'gtk3' 'nss' 'libnotify' 'alsa-lib' 
         'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'icu' 
         'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libice' 'libsm' 'libxext')

provides=('rootchat')
conflicts=('rootchat-bin' 'root-app' 'root-app-bin')
options=('!strip' '!debug')

source_x86_64=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
source_aarch64=("Root-${pkgver}-aarch64.AppImage::https://installer.rootapp.com/installer/Linux/Arm64/Root.AppImage")

sha256sums_x86_64=('1ca63f268c7bcc58b5b34a5308cd54cc550b94443f1254c5dba91ca5919ec6db')
sha256sums_aarch64=('966d4a41e57363f3508d3f886da0a1a8355eeac95f23f788e1df35aeb89f8cda')

noextract=("Root-${pkgver}-x86_64.AppImage" "Root-${pkgver}-aarch64.AppImage")

prepare() {
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="Root-${pkgver}-x86_64.AppImage"
    else
        _appimage="Root-${pkgver}-aarch64.AppImage"
    fi

    # Extract the AppImage
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    
    # Ensure AppRun is executable
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"
    
    install -dm755 "${pkgdir}/usr/bin"
    
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/rootchat"
    
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootchat.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rootchat.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rootchat.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Root
Comment=Community platform combining chat with task management and customizable apps
Exec=env AVALONIA_PLATFORM=wayland rootchat
Icon=rootchat
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
EOF
}

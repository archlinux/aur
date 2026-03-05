# Maintainer: Ackerman
pkgname=rootapp-bin
_pkgname=rootapp
pkgver=0.9.96
pkgrel=1
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64' 'aarch64')
url="https://www.rootapp.com"
license=('custom')

# Dependencies
depends=('zlib' 'gcc-libs' 'glibc' 'fuse2' 'gtk3' 'nss' 'libnotify' 'alsa-lib' 
         'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'icu' 
         'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libice' 'libsm' 'libxext')

provides=('rootapp' 'rootchat-bin')
conflicts=('rootapp' 'rootchat-bin' 'rootchat' 'root-app' 'root-app-bin')
options=('!strip' '!debug')

source_x86_64=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
source_aarch64=("Root-${pkgver}-aarch64.AppImage::https://installer.rootapp.com/installer/Linux/Arm64/Root.AppImage")

sha256sums_x86_64=('e6de174e82848f573f22729c589ac58aca6864d86d0c5482abd94cc5d39072f1')
sha256sums_aarch64=('7f99a7a73338f398ef73016a809fa964f51ea5071f9243c7ba9f8992c0c3461a')

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
    
    # Point the symlink to the universal AppRun file using the new name
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=env AVALONIA_PLATFORM=wayland ${_pkgname}
Icon=${_pkgname}
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
EOF
}

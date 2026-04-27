# Maintainer: Aurel <aurel@example.com>
pkgname=nexus-bin
_pkgname=nexus
pkgver=7.2.0
pkgrel=1
pkgdesc="Nexus Storage - Cross-platform storage management tool"
arch=('x86_64')
url="https://github.com/KOUSSEMON-Aurel/Nexus-Storage"
license=('MIT')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('nexus')
conflicts=('nexus')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('4c0db6996306952d2a788f3588df4833878ebb7c70fca9eb172b1b80bd0edc55')

package() {
    # Installation de l'AppImage
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Extraction des assets (icônes et desktop)
    chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"
    ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract "nexus.desktop" > /dev/null
    ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract "usr/share/icons" > /dev/null
    
    # Installation du fichier .desktop
    install -Dm644 "squashfs-root/nexus.desktop" "${pkgdir}/usr/share/applications/nexus.desktop"
    sed -i 's|Exec=nexus|Exec=/usr/bin/nexus|' "${pkgdir}/usr/share/applications/nexus.desktop"
    
    # Installation des icônes
    cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
}

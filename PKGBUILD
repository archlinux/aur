# Maintainer: Feakster <feakster at posteo dot eu>

pkgname=simplenote-electron-arm-bin
_appimagver=2.3.0
_appimage="${pkgname}-${_appimagver}.AppImage"
pkgver=${_appimagver//-/_}
pkgrel=2
pkgdesc="The simplest way to keep notes"
arch=('armv7h' 'aarch64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('nss' 'gtk3' 'libxss')
optdepends=(
'noto-fonts-emoji: emoji support'
'ttf-joypixels: emoji support'
)
provides=('simplenote')
options=(!strip)
source_armv7h=("${_appimage}"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.AppImage")
source_aarch64=("${_appimage}"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.AppImage")
noextract=("${_appimage}")
b2sums_armv7h=('b9a7eabdd35b4a61cdeaf296c7771d6991c824068b69a03c951ef82c596826d4ff6951bd646bf7abb1a57c4100ce492a72254b2267d2e7d14767425bbce2592e')
b2sums_aarch64=('7ffd079364774395d68ab2a125c074ba09e7f56c54c7db2f100f19a2bafc1d83cb447b0232da857f4cf9cc3cda8b3f66d53be985259defb14b94af96b90ab586')

prepare() {
    # Mark AppImage as executable
    chmod a+x "${_appimage}"
    # Extract AppImage into squashfs-root directory
    ./"${_appimage}" --appimage-extract
    # Set permissions for squashfs-root filesystem
    chmod -R 0755 squashfs-root
}

package() {
    # Go to source directory
    cd "$srcdir"
    
    # Create Installation Directory Structure
    install -dm0755 "${pkgdir}"/usr/bin
    install -dm0755 "${pkgdir}"/opt
    install -dm0755 "${pkgdir}"/usr/share/icons
    
    # Install Icons
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}"/usr/share/icons/
    
    # Modify .desktop file to run executable instead of AppImage
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${provides}|" squashfs-root/${provides}.desktop
    sed -i '/^X-AppImage-Version=/d' squashfs-root/${provides}.desktop
    # Install desktop file
    install -Dm644 squashfs-root/${provides}.desktop -t "${pkgdir}"/usr/share/applications/
    
    # Move package contents to opt
    mv squashfs-root "${pkgdir}"/opt/${pkgname}
    # Symlink /usr/bin executable to opt
    ln -s /opt/${pkgname}/${provides} "${pkgdir}"/usr/bin/${provides}
}

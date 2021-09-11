# Based on https://aur.archlinux.org/obsidian-appimage.git
# Maintainer: Conor <meetcw at outlook dot com>

_pkgname=obsidian

pkgname="${_pkgname}"-native-window
pkgver=0.12.15
pkgrel=1
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse')
makedepends=('nodejs' 'appimagetool')
provides=("${_pkgname}")
conflicts=('obsidian' 'obsidian-appimage' 'obsidian-insider')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('709469528c0c2e9245ccbd8e9cd049829c36a15fdef6b545e6646c1d6060c042')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Remove frameless an hide menu
    npx asar extract ./squashfs-root/resources/obsidian.asar ./obsidian.asar
    sed -i 's/frame: false/frame: true,autoHideMenuBar: true/g' ./obsidian.asar/main.js
    sed -i 's/win.frameless = true/win.framelesss = false/g' ./obsidian.asar/main.js
    npx asar pack ./obsidian.asar ./squashfs-root/resources/obsidian.asar
    unset SOURCE_DATE_EPOCH
    appimagetool squashfs-root
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/Obsidian-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

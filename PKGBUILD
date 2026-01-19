# Maintainer: Tom Himanen <tom.himanen@futuhima.ninja>

pkgname=markus-bin
_appname=markus-the-editor
pkgver=0.1.1
pkgrel=1
pkgdesc="A local WYSIWYG Markdown editor built with Electron, React, and ProseMirror"
arch=('x86_64')
url="https://github.com/erkkimon/markus-the-editor"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libsecret' 'libappindicator-gtk3')
optdepends=('libnotify: for desktop notifications')
provides=('markus' 'markus-the-editor')
conflicts=('markus' 'markus-the-editor')
options=('!strip' '!debug')
source=("Markus-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Markus-${pkgver}.AppImage")
sha256sums=('98cce0c8998d8b9a6f357102696d5a7e15f9ee8e671e277e46ad50991d3a9dac')

prepare() {
    chmod +x "Markus-${pkgver}.AppImage"
    "./Markus-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install to /opt
    install -dm755 "${pkgdir}/opt/${_appname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${_appname}/"

    # Fix permissions
    find "${pkgdir}/opt/${_appname}" -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}/opt/${_appname}/${_appname}"

    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_appname}/${_appname}" "${pkgdir}/usr/bin/markus"

    # Install desktop file
    install -Dm644 "squashfs-root/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Fix desktop file Exec path
    sed -i "s|Exec=AppRun|Exec=/opt/${_appname}/${_appname}|g" \
        "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Install icons from extracted AppImage
    for size in 16 32 48 64 128 256; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_appname}.png"
    done

    # Install license
    install -Dm644 "squashfs-root/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

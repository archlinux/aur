# Maintainer: Plague-doctor <plague at privacyrequired dot com>

pkgname=standard-notes-bin
pkgver=3.5.11
pkgrel=1
pkgdesc='Standard Notes'
arch=('x86_64')
url='https://standardnotes.org'
license=('AGPL3')
_shortname=standard-notes
_appimage=$_shortname-$pkgver-$pkgrel.AppImage
depends=('hicolor-icon-theme')
options=(!strip)
conflicts=('standardnotes-desktop')
source=(
        "${_appimage}::https://github.com/standardnotes/desktop/releases/download/v$pkgver/$_shortname-$pkgver-linux-x86_64.AppImage"
)
sha256sums=('8ef533758303bc37ce693d73f5667d8d28b77114363968a93cc5cf011a0032ba')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    cd "$srcdir"

    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"

    # Install AppImage
    install -Dm755 "${_appimage}" -t "${pkgdir}/opt/${_shortname}/"


    # Install Icons, Desktop Shortcut
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons/"
    chmod 755 -Rf "${pkgdir}/usr/share/icons"
    chmod 644 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_shortname}.png"
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|" "squashfs-root/${_shortname}.desktop"
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications/"

    ## Symlink AppImage
    ln -s "/opt/${_shortname}/${_appimage}" "${pkgdir}/usr/bin/${_shortname}"
}


# Maintainer: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
pkgver=3.8.6
pkgrel=1
pkgdesc='Standard Notes'
arch=('x86_64')
url='https://standardnotes.org'
license=('AGPL3')
_shortname=standard-notes
_appimage=$pkgname-$pkgver-$pkgrel.AppImage
depends=('hicolor-icon-theme')
options=(!strip)
conflicts=('standardnotes-desktop')
source=(
        "${_appimage}::https://github.com/standardnotes/desktop/releases/download/v$pkgver/$_shortname-$pkgver-linux-x86_64.AppImage"
)
sha256sums=('2fbe46d785d38d1c2274902d71856cf52582f33120cd9bfff48522d2ed4cb5f3')

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


# Maintainer: Plague-doctor <plague at privacyrequired dot com>

pkgname=jubler-bin
pkgver=7.0.3
pkgrel=1
pkgdesc='A tool to edit text-based subtitles.'
arch=('x86_64')
url='https://www.jubler.org/index.html'
license=('GPL2')
_shortname=jubler
_appimage=$pkgname-$pkgver-$pkgrel.AppImage
depends=('hicolor-icon-theme')
options=(!strip)
#conflicts=('')
source=(
        "${_appimage}::https://github.com/teras/Jubler/releases/download/v${pkgver}/Jubler-${pkgver}.x86_64.appimage"
)
sha256sums=('8a82d6123f8f9b5d13640bcbf6296da1af31c359e69fa4717d2450c433ba2c04')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract
}

package() {
    cd "$srcdir"

    ## Create Directories
    install -d "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    install -dm755 "${pkgdir}/opt/${_shortname}"

    ## Install AppImage
    install -Dm755 "${_appimage}" -t "${pkgdir}/opt/${_shortname}/"


    ## Install Icons, Desktop Shortcut
    cp -r squashfs-root/usr/share/icons/hicolor "${pkgdir}/usr/share/icons/"
    chmod 755 -Rf "${pkgdir}/usr/share/icons"
    chmod 644 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_shortname}.png"
    #sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_shortname}|" "squashfs-root/${_shortname}.desktop"
    install -Dm644 "squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications/"

    ### Symlink AppImage
    ln -s "/opt/${_shortname}/${_appimage}" "${pkgdir}/usr/bin/${_shortname}"
}


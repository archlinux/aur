# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="gmedit-bin"
_pkgname="electron"
pkgver="5.6.20"
pkgrel=1
arch=('x86_64')
pkgdesc="A code editor for GameMaker: Studio and GameMaker Studio 2 projects"
url="https://github.com/GameMakerDiscord/GMEdit"
license=('MIT')
makedepends=('gendesk')
conflicts=('gmeedit')
source_x86_64=(
    # Official File is here (https://yellowafterlife.itch.io/gmedit) but does not support direct download links. So im mirroring it
    "gmedit-editor-${pkgver}.zip::https://cdn.crankysupertoon.live/dist/gmedit-editor-linux.zip"
)

md5sums_x86_64=('SKIP')

prepare() {
    # Generate .desktop
    gendesk --pkgname "GMEdit" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "GMEdit.desktop" "${pkgname}.desktop"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

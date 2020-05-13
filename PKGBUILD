# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher-bin"
_pkgname="gdlauncher"
pkgver="0.0.9"
pkgrel=1
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience
"
url="https://gdevs.io"
license=('GPL3')
makedepends=('gendesk')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')

source_x86_64=(
    "gdlauncher-${pkgver}-1-x86_64.pkg.tar.xz::https://github.com/gorilla-devs/GDLauncher-Releases/releases/download/v${pkgver}/gdlauncher-${pkgver}-1-x86_64.pkg.tar.xz"
)

md5sums_x86_64=('SKIP')

prepare() {
    # Generate .desktop
    gendesk -f --pkgname "GDLauncher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n
    mv "GDLauncher.desktop" "${pkgname}.desktop"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    mv "${srcdir}/opt/${_pkgname}" "${srcdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/opt/${pkgname}"* "${pkgdir}/opt/"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    mv "${srcdir}/usr/share/icons/icon.png" "${srcdir}/usr/share/icons/gdlauncher-bin.png"
    cp -Rr "${srcdir}/usr/share/icons/gdlauncher-bin.png" "${pkgdir}/usr/share/icons/"
    
    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

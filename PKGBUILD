# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="replit-desktop-bin"
_pkgname="repl.it"
pkgver="1.1.0"
pkgrel=1
arch=('x86_64')
pkgdesc="Un-official electron desktop app for https://repl.it"
url="https://github.com/repl-it-discord/repl-it-electron"
license=('Apache 2.0')
makedepends=('gendesk' 'wget')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('gdlauncher-appimage' 'gdlauncher' 'gdlauncher-git')
source_x86_64=(
    "repl.it-linux-x64.zip::https://github.com/repl-it-discord/repl-it-electron/releases/download/${pkgver}/repl.it-linux-x64.zip"
)

md5sums_x86_64=('SKIP')

prepare() {
    # Generate .desktop
    gendesk -f --pkgname "Repl.it" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n
    mv "Repl.it.desktop" "${pkgname}.desktop"
    
    # Download icon
    wget https://repl.it/public/images/icon-square.png
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon-square.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

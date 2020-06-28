# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher-bin"
_pkgname="gdlauncher"
pkgver="1.0.8"
pkgrel=1
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
makedepends=('gendesk' 'wget')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('gdlauncher-appimage' 'gdlauncher' 'gdlauncher-git')
source_x86_64=(
    "GDLauncher-linux-setup.zip::https://github.com/gorilla-devs/GDLauncher/releases/download/v${pkgver}/GDLauncher-linux-setup.zip"
)

md5sums_x86_64=('SKIP')

prepare() {
    # Generate .desktop
    gendesk -f --pkgname "GDLauncher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n
    mv "GDLauncher.desktop" "${pkgname}.desktop"
    
    # Download icon
    wget https://github.com/gorilla-devs/GDLauncher/raw/master/public/icon.png
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
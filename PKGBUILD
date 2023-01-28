# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="koalalauncher-bin"
_pkgname="koalalauncher"
pkgver="1.2.1"
pkgrel=1
arch=('x86_64')
pkgdesc="Koala Launcher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://koalalauncher.com"
license=('GPL3')
makedepends=('gendesk' 'wget')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('koalalauncher')
source_x86_64=(
    "KoalaLauncher-${pkgver}.zip::https://github.com/KoalaDevs/KoalaLauncher/releases/download/v${pkgver}/KoalaLauncher-linux-setup.zip"
    "icon.png::https://raw.githubusercontent.com/KoalaDevs/KoalaLauncher/master/public/icon.png"
)

md5sums_x86_64=("5938f89ac06a19efa283bd7226dfa015" "SKIP")

prepare() {
    # Generate .desktop
    gendesk --pkgname "Koala Launcher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Koala Launcher.desktop" "${pkgname}.desktop"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/"* "${pkgdir}/opt/${pkgname}"
    mv "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

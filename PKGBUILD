# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="koalalauncher"
_pkgname="KoalaLauncher"
pkgver="1.2.1"
pkgrel=1
arch=('x86_64')
pkgdesc="Koala Launcher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://koalalauncher.com"
license=('GPL3')
makedepends=('gendesk' 'git' 'yarn' 'nodejs' 'rust' 'unzip')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('koalalauncher-bin')
source=("${pkgver}.zip::https://github.com/KoalaDevs/KoalaLauncher/archive/v${pkgver}.zip")
md5sums=('015e9a47fc5830a579336581ebce6e8b')

prepare() {
    # generate .desktop
    gendesk --pkgname "Koala Launcher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Koala Launcher.desktop" "${pkgname}.desktop"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm i --legacy-peer-deps
    export NODE_OPTIONS=--openssl-legacy-provider
    npm run release
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/deploy"
    mkdir ${pkgname}/
    unzip "KoalaLauncher-linux-setup.zip" -d koalalauncher
    cp -Rr "${srcdir}/${_pkgname}-${pkgver}/deploy/${pkgname}"* "${pkgdir}/opt/"

    # desktop entry
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/${_pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blueknight-bin
_pkgname=BlueKnight
pkgver=1.1.3
_electronversion=28
pkgrel=1
pkgdesc="A Minecraft Launcher made with electron, that uses the Modrinth api to make installing mods as easy as possible.Beta version."
arch=('x86_64')
url="https://github.com/KartoffelChipss/blueknight"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}-beta/${pkgname%-bin}-launcher-deb-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e67bde47df786db286b9b8ebb46ed2e79603f8c11bd7bcc0b19cf20970b42fe'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"\/opt\/${_pkgname} Launcher\/${pkgname%-bin}\"|${pkgname%-bin}|g;s|Utility|Game|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname} Launcher/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copytranslator-bin
pkgver=9.1.0
_electronversion=6
pkgrel=5
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=('x86_64')
url="https://copytranslator.gitee.io/"
_ghurl="https://github.com/CopyTranslator/CopyTranslator"
license=('GPL-2.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('426f706acc80610731116b2317540fd10e844f597ca0489c83934f8ac3c0527a'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -e "s|process.resourcesPath,\"locales|process.resourcesPath,\"../.././${pkgname%-bin}/locales|g" \
        -e "s|tray@2x.png|../.././${pkgname%-bin}/tray@2x.png|g" \
        -e "s|return !0 === this.app.isPackaged|return 0 === this.app.isPackaged|g" \
        -i "${srcdir}/app.asar.unpacked/background.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/resources/linux-icon/icon.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"{linux-icon,locales,tray@2x.png} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
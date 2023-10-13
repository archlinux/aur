# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tome-bin
_pkgname=Tome
pkgver=0.7.6
pkgrel=1
pkgdesc="Git integrated cross-platform markdown editor"
arch=("x86_64")
url="https://tome.evinowen.net/"
_githuburl="https://github.com/evinowen/tome"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron18')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_pkgname}.Setup.${pkgver}.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/evinowen/tome/${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('d5a368995788813d2a971e1560a009da2b98311256b82151ebe8573600ba03bb'
            '3103a7058613516746435f89ff07509d42d9a07a485ad7b7fbc2781b06be4722'
            'fe74133d1de8b40ac8e0351b7f9a59ad8c22a50c806ac77b09d7797ec3847029')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    unlink "${srcdir}/app.asar.unpacked/node_modules/nodegit/build/node_gyp_bins/python3"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
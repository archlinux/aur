# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ptree-bin
_appname=PTree
pkgver=2.1.3
pkgrel=1
pkgdesc="Design power tree and estimate consumptions"
arch=("x86_64")
url="https://smariel.github.io/PTree"
_githuburl="https://github.com/smariel/PTree"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('2c529eb6dc17f967ae90b3680daee269be18a1d8708e18cd1a5ea91c59f161be'
            'c4a5124e86987cedbf9e329f2dd752ff749731fdd971b7c0e7353d1dd18b1e57')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    asar extract "${srcdir}/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/app.asar.unpacked/icons/png/app/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
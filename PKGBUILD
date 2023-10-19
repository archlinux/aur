# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=akuse
_pkgname=Akuse
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple and easy to use anime streaming desktop app without ads."
arch=('any')
url="https://github.com/akuse-app/Akuse"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip"
    "clientData.js"
    "${pkgname}.sh")
sha256sums=('e8ab3647d89ebbc277ab9833aa7723139a7722184c067f13a91e830551e23f06'
            '2b268bdffb07dac827d76861fe2efe66969bdf418e016c364fb3dd02b6cd2455'
            'b24142f7a1722021cf93134af3eccc3ced1b484500f7ee7d8f22a54b594329aa')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -e '81,83d' -e '/"deb"/d' -e 's|"AppImage",|"AppImage"|g' -i package.json
    cp "${srcdir}/clientData.js" "${srcdir}/${_pkgname}-${pkgver}/src/modules"
    npm install
    npm run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/img/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
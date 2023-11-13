# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=akuse
_pkgname=Akuse
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple and easy to use anime streaming desktop app without ads."
arch=('any')
url="https://github.com/akuse-app/Akuse"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip"
    "clientData.js"
    "${pkgname}.sh"
)
sha256sums=('925210ba0759105323c311a50ab6f52822a16a1525c36a2fc422bacda1b0076d'
            '2b268bdffb07dac827d76861fe2efe66969bdf418e016c364fb3dd02b6cd2455'
            '91955296a742aed4445743bb54ec2c389917f36bca4969bb8d50bcfa8f80d7b2')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -e '81,83d' -e '/"AppImage"/d' -e 's|"deb"|"AppImage"|g' -i package.json
    cp "${srcdir}/clientData.js" "${srcdir}/${_pkgname}-${pkgver}/src/modules"
    npm install
    npm run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/img/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
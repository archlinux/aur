# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudhub-bin
_pkgname=CloudHub
_zhsname="云之家"
pkgver=4.3.2
_electronversion=12
pkgrel=1
pkgdesc="云之家桌面端"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.yunzhijia.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'gtk2'
    'java-runtime'
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}.html::${url}/public/agreement/client-agreement.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://res.yunzhijia.com/mixed/cloudhubx/linux_arm64/${_pkgname}_arm64_${pkgver}_2408121234.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://res.yunzhijia.com/mixed/cloudhubx/linux_x64/${_pkgname}_x64_${pkgver}_2408121234.deb")
sha256sums=('c4088260f72395d24a8ba49eaaa78620895489107af496c7d00976f8c8825dae'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('7a5189dd2bb3832ba5fce18824dbc8963a440a3825f38e388a242d613274de69')
sha256sums_x86_64=('5e4d341d7aa30363fce77f23a9602eefd794c1da1a3057fec912814f516bf7db')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"\/opt\/${_zhsname}\/${_pkgname}\"|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/build" -type f -name "*.js" -exec \
        sed -i "s|= process.resourcesPath|= \"\/usr\/lib\/${pkgname%-bin}\"|g;s|process.env.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" {} \;
    find "${srcdir}/app.asar.unpacked/build" -type f -name "*.html" -exec \
        sed -i "s|= process.resourcesPath|= \"\/usr\/lib\/${pkgname%-bin}\"|g;s|process.env.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" {} \;
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,logo.png} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024 2048x2048;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/opt/${_zhsname}/license/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
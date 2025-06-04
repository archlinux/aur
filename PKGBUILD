# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudhub-bin
_pkgname=CloudHub
_zhsname='云之家'
pkgver=4.5.4
_electronversion=12
pkgrel=1
pkgdesc="The desktop client of CloudHub.(Prebuilt version.Use system-wide electron)云之家桌面端"
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
options=(
    '!strip'
)
source=(
    "LICENSE-${pkgver}.html::${url}/public/agreement/client-agreement.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_arm64/${_pkgname}_arm64_${pkgver}_2505152055.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_x64/${_pkgname}_x64_${pkgver}_2505152053.rpm")
sha256sums=('c4088260f72395d24a8ba49eaaa78620895489107af496c7d00976f8c8825dae'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('e1fea5c3706d162c86aa18cea9b2e209b8833e27b2fe0d48f0f720e2ab03190f')
sha256sums_x86_64=('cca4bbbb0e3cb2a8655075a0346d058bdfda20b456191fc4345d220ddd81ddf7')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/build" -type f -name "*.js" -exec \
        sed -i -e "
            s/= process.resourcesPath/= \"\/usr\/lib\/${pkgname%-bin}\"/g
            s/process.env.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g
        " {} +
    find "${srcdir}/app.asar.unpacked/build" -type f -name "*.html" -exec \
        sed -i -e "
            s/= process.resourcesPath/= \"\/usr\/lib\/${pkgname%-bin}\"/g
            s/process.env.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g
        " {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,logo.png} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 128x128 256x256 1024x1024 2048x2048)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/opt/${_zhsname}/license/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
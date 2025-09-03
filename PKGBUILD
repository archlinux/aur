# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudhub-bin
_pkgname=CloudHub
_zhsname='云之家'
pkgver=5.0.0
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
    'gtk2'
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_arm64/${_pkgname}_arm64_${pkgver}_2508281633.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_x64/${_pkgname}_x64_${pkgver}_2508281631.rpm")
sha256sums=('e7bd9b52b886a7bdcc36eb66cc16a993754b22f1fd4644d1db6f0e27cd6ebcca'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('f23df3e2afcc88e77bcf6403116bc31cae9a9402b8ecbd84109420b15582c42e')
sha256sums_x86_64=('68179fd30c724aa036d28ae50431ebd9140bb40b329bf251fc30d231bc63a99b')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_zhsname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
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

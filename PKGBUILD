# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudhub-bin
_pkgname=CloudHub
_zhsname='云之家'
pkgver=5.0.5
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_arm64/${_pkgname}_arm64_${pkgver}_2601301023.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://res.yunzhijia.com/mixed/cloudhubx/linux_x64/${_pkgname}_x64_${pkgver}_2601301020.rpm")
sha256sums=('e7bd9b52b886a7bdcc36eb66cc16a993754b22f1fd4644d1db6f0e27cd6ebcca'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('aac7bd6df65b72d59a207d4d93fe7d23ab42cada43b495e315d7d562cdd38626')
sha256sums_x86_64=('9517aff47a1bf3e238c5c0f44f5fb5a4011ac7981530df91aa9dd263e4a153fe')
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
    rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar"
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
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${srcdir}/app.asar.unpacked/resource/linux/256x256-redot.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_zhsname}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/opt/${_zhsname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_zhsname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_zhsname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024 2048x2048)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/resource/linux/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/opt/${_zhsname}/license/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

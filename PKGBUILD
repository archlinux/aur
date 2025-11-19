# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
pkgname=baidu-translate-client-bin
_pkgname=BdTranslateClient
_zhsname='百度翻译'
pkgver=2.1.0
_electronversion=11
pkgrel=1
pkgdesc="Baidu translate.(Prebuilt version.Use system-wide electron)${_zhsname}"
arch=(
    'i686'
    'x86_64'
)
url="https://fanyi.baidu.com/"
license=('LicenseRef-custom')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-client-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libxkbcommon-x11'
)
makedepends=(
    '7zip'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://fanyiapp.cdn.bcebos.com/fanyi-client/pkg/win/${pkgver}/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91_Setup_${pkgver}.exe"
    "${pkgname%-bin}.desktop"
    "LICENSE-${pkgver}.html::https://fanyi.baidu.com/static/webpage/agreement.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('14b28e1f65e2116cf5376a063d79fa1450128f043de0d12811d393a4275a8e69'
            '883caab57df8960f025758fa321da15cdac180dfc3688d7ec975c142ccd0d3ad'
            '1bac6150492bcebb1b2f74fc4a6712a8cd9317abf3107e6fa8ca357e5023bbf7'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_zhsname}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare(){
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/--disable-gpu-sandbox/g
    " "${srcdir}/${pkgname%-bin}.sh"
    7z e "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -aoa
    _get_electron_version
    wrestool -x --output="${srcdir}" -t14 "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    icotool -i 5 -x "${srcdir}/"*.ico -o "${srcdir}/${pkgname%-bin}.png"
    case "${CARCH}" in
        i686)
            bsdtar -xf "${srcdir}/app-32.7z"
            ;;
        x86_64)
            bsdtar -xf "${srcdir}/app-64.7z"
            ;;
    esac
    find "${srcdir}/resources/app.asar.unpacked" \( -name "*win32*" -o -name "*darwin*" \) -exec rm -rf {} +
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
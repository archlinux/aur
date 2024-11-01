# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
pkgname=baidu-translate-client-bin
_pkgname=BdTranslateClient
_zhsname="百度翻译"
pkgver=1.8.0
_electronversion=11
pkgrel=2
pkgdesc="Baidu translate.Prebuilt version.Use system-wide electron.${_zhsname}"
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
    'p7zip'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://fanyiapp.cdn.bcebos.com/fanyi-client/pkg/win/${pkgver}/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91_Setup_${pkgver}.exe"
    "${pkgname%-bin}.desktop"
    "LICENSE-${pkgver}.html::https://fanyi.baidu.com/static/webpage/agreement.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('8945fc7c6bac6d69d7208c21afed377ad46c4051f284b6b9fe10db8d268a6970'
            '883caab57df8960f025758fa321da15cdac180dfc3688d7ec975c142ccd0d3ad'
            'ef6eb077ee83490ded38457163af72b73171b99d9e5540605cd6c4bc7d1ac661'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build(){
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/--disable-gpu-sandbox/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    7z e "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -aoa
    wrestool -x --output="${srcdir}" -t14 "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    icotool -i 5 -x "${srcdir}/"*.ico -o "${srcdir}/${pkgname%-bin}.png"
    case "${CARCH}" in
      aarch64)
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
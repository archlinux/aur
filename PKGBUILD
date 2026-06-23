# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechesscontrol-bin
_pkgname=ChineseChess
_debname="io.github.KangLin.${_pkgname}"
pkgver=2.0.14
pkgrel=1
pkgdesc="Including Chinese chess MFC extension library, Chinese chess activex controls, Chinese chess Qt plugin, artificial intelligence engine, etc(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/KangLin/ChineseChessControl"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'qt6-multimedia'
    'qt6-base'
    'qt6-svg'
    'qt6-scxml'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_aarch64_Setup.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64_Setup.zip")
sha256sums=('e851b25999d06859cc1551500796ce2fd82dc4bda3c0a29fde2a036028c93bc7')
sha256sums_aarch64=('2ab12c3df897cb28d765b7c5c0ea57755602c119e09801cedb91935a0f943d57')
sha256sums_x86_64=('b5c6dab7b75953defdc82a1d9a8c0fb6cf0b9fa92c72b4751a181e0213116afd')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}App-v${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_pkgname}_${pkgver}_Linux_${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_pkgname}_${pkgver}_Linux_${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_pkgname}_${pkgver}_Linux_${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}App/Exec=${pkgname%-bin}/g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_Linux_${CARCH}_Setup/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}

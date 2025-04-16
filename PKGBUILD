# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=transmart
pkgname="tencent-${_pkgname}-bin"
_appname=TranSmart
_zhsname='腾讯交互翻译'
pkgver=Alpha0.10.1
pkgrel=9
pkgdesc="腾讯交互翻译融合了腾讯人工智能实验室自研的交互式机器翻译、神经网络机器翻译、 统计机器翻译、语义理解、信息检索等技术，帮助用户更快、更好地完成翻译任务。"
arch=('x86_64')
url="https://transmart.qq.com/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'alsa-lib'
    'qt6-declarative'
    'openssl-1.1'
    'nspr'
    'nss'
)
makedepends=(
    'gendesk'
)
optdepends=(
    'fcitx-qt5'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://cdn.transmart.qq.com/installation_pro/${_appname}_${pkgver}(20230713)_linux.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('acef0abb8fc0af1fa11514ceb5ea3f615c132e2c7770c58cfb9ca29f571ad3d7'
            'edf41565ee37d6a8ee184307ca75908e932b4df15b2690a268d41ec65a0a71a7')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="tencent-${_pkgname}-bin" \
        --name="${_appname}" \
        --categories="Utility" \
        --mimetypes="x-scheme-handler/${_pkgname}" \
        --exec="${pkgname%-bin} %F"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    mv "${srcdir}/${_pkgname}_${pkgver}_linux/使用说明" "${srcdir}/${_pkgname}_${pkgver}_linux/README"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_${pkgver}_linux/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_linux/README" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_linux/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_pkgname=iFinD
_appname="com.51${pkgname%-bin}"
pkgver=1.10.12.382.002
pkgrel=1
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.51ifind.com/"
_dlurl="https://sp.thsi.cn/staticS3/mobileweb-upload-static-server.file/app_6/downloadcenter"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'nss'
    'hicolor-icon-theme'
    'alsa-lib'
    'libva'
    'libxrandr'
    'libxkbcommon'
    'at-spi2-core'
    'libcups'
    'libxcomposite'
    'fontconfig'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_appname}_kylin_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_appname}_kylin_${pkgver}_amd64_signed.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('96d574d7f662445c81c0e1582f1aa1ab39ed6ab659956ee98210d9436a423ead')
sha256sums_aarch64=('b804cc497dfbcb00855325d6341f36473d401d6493f92753a181507a68d43fbd')
sha256sums_x86_64=('67b4e413081a6676cb39a12fbf77b3b2ebe9e58e77d006648d74767d4f330ef7')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/apps/${_appname}/files/bin/run.sh\"|${pkgname%-bin} %F|g" \
        -e "s|/opt/apps/_appname/entries/_appname.svg|${pkgname%-bin}|g" \
        -e "s|Name=_appname|Name=com.51ifind|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}

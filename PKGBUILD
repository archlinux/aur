# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_pkgname=iFinD
_appname="com.51${pkgname%-bin}"
pkgver=1.10.12.387.002
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
    'alsa-lib'
    'libxrandr'
    'libxkbcommon'
    'libcups'
    'libxcomposite'
    'libxdamage'
    'at-spi2-core'
    'libva'
    'libdrm'
    'mesa'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_appname}_uos_${pkgver}_amd64_signed.deb")
sha256sums_aarch64=('a1f04769b14d715da5dd64fe18445ec7c05a5efeb1236ec35adf9beb91ab05ab')
sha256sums_x86_64=('e226a870af8439c0e359b15b11a915b2c0ee8132f5c1d12879da35eab8352209')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"\/opt\/apps\/${_appname}\/files\/bin\/run.sh\"|${pkgname%-bin} %F|g" \
        -e "s|\/opt\/apps\/${_appname}\/entries\/icons\/hicolor\/scalable\/apps\/${_appname}.svg|${pkgname%-bin}|g" \
        -e "s|Name=${_appname}|Name=${_pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/apps/${_appname}/files/bin/run.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
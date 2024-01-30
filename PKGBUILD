# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiantianmazi-bin
_chsname="天天码字"
_appname=ttmz
pkgver=1.0.1
pkgrel=4
pkgdesc="天天码字是面向网文作者人群的一款方便,适用的码字工具平台."
arch=('x86_64')
url="http://www.tiantianmazi.com/"
license=('LicenseRef-custom')
provides=("${_appname}")
conflicts=("${pkgname%-bin}" "${_appname}")
depends=(
    'alsa-lib'
    'hicolor-icon-theme'
    'gtk3'
    'nodejs'
    'nss'
    'nspr'
    'python'
    'python-setuptools'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::http://asset.yycdn.cn/app/%E5%A4%A9%E5%A4%A9%E7%A0%81%E5%AD%97.deb"
    "LICENSE-${pkgver}.html::${url}/agreement.html"
)
sha256sums=('8dbb468c3fb9e03f63c543d68c2b2855b6381df153aada3a0ea4ff8d87de937b'
            '92d01a96c324eb11ef8600d1014c5ac041c7ad30649f399a5c3fd83181b6ab30')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_chsname}/${_appname}.png|${pkgname%-bin}|g;s|\"/opt/${_chsname}/${_appname}\"|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_chsname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    touch "${pkgdir}/opt/${pkgname%-bin}/debug.txt"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=typora
pkgname="${_appname}-free-with-plugin"
_pkgname=Typora
pkgver=1.11.4
_typoraver=0.11.18
_electronversion=13
pkgrel=1
pkgdesc="A minimal markdown editor and reader(free version). with obgnail/typora_plugin plugin."
arch=(
    "aarch64"
    "x86_64"
)
url="https://typora.io/"
_dlurl="https://github.com/wyf9661/typora-free"
_pluginurl="https://github.com/obgnail/typora_plugin"
license=('LicenseRef-custom')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
    "${_appname}-free"
    "${_appname}-cn"
    "${_appname}-free-cn"
    "${_appname}-electron"
)
depends=(
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
)
source=(
    "${_appname}-plugin-${pkgver}.tar.gz::${_pluginurl}/archive/refs/tags/${pkgver}.tar.gz"
)
source_aarch64=("${pkgname%-bin}-${_typoraver}-aarch64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${_typoraver}-x86_64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_amd64.deb")
sha256sums=('4c1ae22d21b7dc95bd9a934121f157bebebf59fc907f0fb3fae9ef86be844d57')
sha256sums_aarch64=('12ad46732c4da7d9414701c584fee942baf83b89165563f18ba03d859eb59ad8')
sha256sums_x86_64=('a202935a754c4b7344cc947db143e12885e4a716ca5f70f607f0318c346bb6c6')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/${_appname} %U/${pkgname%-bin} --no-sandbox %U/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script>/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script><script src=\".\/plugin\/index.js\" defer=\"defer\"><\/script>/g" \
        "${srcdir}/usr/share/${_appname}/resources/window.html"
    cp -Pr --no-preserve=ownership "${srcdir}/${_appname}_plugin-${pkgver}/"{assets,plugin} "${srcdir}/usr/share/${_appname}/resources/"
}
package() {
    install -Dm755 -d "${pkgdir}/"{/usr/lib/"${pkgname%-bin}",usr/bin}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_appname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/${_appname}/resources//assets/icon/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
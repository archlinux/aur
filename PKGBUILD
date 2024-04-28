# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=typora
pkgname="${_appname}-free-with-plugin"
_pkgname=Typora
pkgver=0.11.18
_pluginver=1.8.29
_electronversion=13
pkgrel=8
pkgdesc="A minimal markdown editor and reader(free version). with obgnail/typora_plugin plugin."
arch=(
    "aarch64"
    "x86_64"
)
url="https://typora.io/"
_dlurl="https://github.com/wyf9661/typora-free"
_pluginurl="https://github.com/obgnail/typora_plugin"
license=('LicenseRef-custom')
provides=("${_appname}-free=${pkgver}")
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
    "${_appname}-plugin-${_pluginver}.tar.gz::${_pluginurl}/archive/refs/tags/${_pluginver}.tar.gz"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('b5b492603193757da928029e2618d57a5712edcc6f33d0cacfccfdcabcc3e083')
sha256sums_aarch64=('12ad46732c4da7d9414701c584fee942baf83b89165563f18ba03d859eb59ad8')
sha256sums_x86_64=('a202935a754c4b7344cc947db143e12885e4a716ca5f70f607f0318c346bb6c6')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname} %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed 's|<script src="./appsrc/window/frame.js" defer="defer"></script>|<script src="./appsrc/window/frame.js" defer="defer"></script><script src="./plugin/index.js" defer="defer"></script>|g' \
        -i "${srcdir}/usr/share/${_appname}/resources/window.html"
    cp -r "${srcdir}/${_appname}_plugin-${_pluginver}/"{assets,plugin} "${srcdir}/usr/share/${_appname}/resources/"
}
package() {
    install -Dm755 -d "${pkgdir}/"{/opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/share/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
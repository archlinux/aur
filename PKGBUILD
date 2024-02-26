# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yesplaymusic
pkgname="my-${_pkgname}-bin"
_appname=YesPlayMusic
pkgver=0.4.14
_electronversion=13
pkgrel=2
pkgdesc="A third party music player for Netease Music.高颜值的第三方网易云播放器，支持本地音乐播放、离线歌单、桌面歌词、Touch Bar歌词、Mac状态栏歌词显示。"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://my-yesplaymusic-five.vercel.app/"
_ghurl="https://github.com/stark81/my_yesplaymusic"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
    "r3play"
    "r3playx"
)
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/stark81/my_yesplaymusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
sha256sums_aarch64=('2c1366c944eacd09be5b9dc18017ba56a3bafd536942c272b056c2d2b8e1c668')
sha256sums_armv7h=('50c9336fa6832bbcdc71507d3777e5e439ee680cf57e5dc8c70258b7718e3927')
sha256sums_x86_64=('520b4579860b1e0b77331f540395e9fe1d1c49c12b44ff6b182e50da9b0e19b2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png" "${srcdir}/app.asar.unpacked/tray-icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -e "s|/opt/${_appname}/${_pkgname} %U|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -e "s|Categories=Music;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/app.asar.unpacked/img/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
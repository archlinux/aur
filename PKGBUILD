# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yesplaymusic
pkgname="my-${_pkgname}-bin"
_appname=YesPlayMusic
pkgver=0.4.16
_electronversion=13
pkgrel=1
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
    "electron${_electronversion}-bin"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/stark81/my_yesplaymusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('5ece65608866f82fc73304a028422fa5c0301ed2a176edcf59e22df32b0f023f')
sha256sums_armv7h=('1c75033a95baa60ca1edfc3008a08f7f418623a90c6781e9fa90d6e27197b486')
sha256sums_x86_64=('3531e9e7b4c369f23932808663efcc79e34b0179e6e571e7262dd79933357c25')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${_appname}/${_pkgname} %U|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -e "s|Categories=Music;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 24x24 88x88;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=vutronmusic
pkgname="${_appname}-electron-bin"
_pkgname=VutronMusic
pkgver=1.7.6
_electronversion=34
pkgrel=1
pkgdesc="A high-quality third-party NetEase Cloud Music player that supports local music playback, offline playlists, and desktop lyrics.(Prebuilt version,use system-wide electron)高颜值的第三方网易云播放器，支持本地音乐播放、离线歌单、桌面歌词、Touch Bar歌词、Mac状态栏歌词显示、Linux-gnome桌面状态栏歌词显示."
arch=('x86_64')
url="https://github.com/stark81/VutronMusic"
license=('MIT')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}_linux_${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/stark81/VutronMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('71eea1f36e67ee9b21c8fb50ae3a1592fb6ae80808ab46e33887776e45c473dc'
            '6e2dc41556237850d3e147d56d4bf63718f8044e2898a99599367b723418af1e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname%music}/${pkgname%-bin}/g
        s/Icon=${_appname%music}/Icon=${pkgname%-bin}/g
        s/Utility/AudioVideo/g
    " "${srcdir}/usr/share/applications/${_appname%music}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname%music}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname%music}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
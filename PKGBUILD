# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkmusicplayer-bin
_pkgname=TTKMusicPlayer
pkgver=3.4.0.0
pkgrel=5
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=(
    'GPL3'
    'LGPL3'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-x11extras'
    'qt5-base'
    'libcups'
    'nspr'
    'nss'
    'libxcomposite'
    'libxcb'
    'libglvnd'
    'fontconfig'
    'freetype2'
    'gstreamer'
    'libxkbcommon'
    'libxrandr'
    'expat'
    'libpulse'
    'libxfixes'
    'libx11'
    'libxtst'
    'libxxf86vm'
    'libxrender'
    'gst-plugins-base-libs'
    'libxext'
    'libxcursor'
    'alsa-lib'
    'libxi'
    'libxdamage'
    'qt5-declarative'
)
makedepends=(
    'gendesk'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.7z"
    "${pkgname%-bin}.sh"
)
sha256sums=('8e69eceff065b67479ecd38841287842c87c093e719a2596309476944d3a2809'
            '953b64302063c9bfd60b81aa128323f0f15d167d22ecc62333674c26dd1c0dec')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|" \
        -e "s|@runname@|${_pkgname}|g" \
        -e "s|@pkgver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "AudioVideo;Player;Audio;Qt" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -C "${srcdir}/${pkgname%-bin}"
    rm -rf "${srcdir}/${pkgname%-bin}/Downloads"
    find "${srcdir}/${pkgname%-bin}" -type f -exec chmod 644 {} \;
    find "${srcdir}/${pkgname%-bin}" -type d -exec chmod 755 {} \;
    find "${srcdir}/${pkgname%-bin}" -type f -name "TTK*" -exec chmod 755 {} \;
    chmod 755 "${srcdir}/${pkgname%-bin}/${pkgver}/QtWebEngineProcess"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
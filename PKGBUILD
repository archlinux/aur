# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkmusicplayer-bin
_pkgname=TTKMusicPlayer
pkgver=3.5.0.0
pkgrel=1
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=(
    'GPL-3.0-only'
    'LGPL-3.0-only'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-x11extras'
    'qt5-base'
    'alsa-lib'
    'qt5-declarative'
)
makedepends=(
    'gendesk'
    'p7zip'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.7z"
    "${pkgname%-bin}.sh"
)
sha256sums=('890c68425742af575d613f3c526130a55b47c4749fa73058c05df6a01c95bfd7'
            '49a0410566fd177649695979287d994db641ba9cca304692b62ad6085886721d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|" \
        -e "s|@runname@|${_pkgname}|g" \
        -e "s|@pkgver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "AudioVideo;Player;Audio;Qt" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -o"${srcdir}/opt/${pkgname%-bin}"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/Downloads"
    find "${srcdir}/opt/${pkgname%-bin}" -type f -exec chmod 644 {} \;
    find "${srcdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
    find "${srcdir}/opt/${pkgname%-bin}" -type f -name "TTK*" -exec chmod 755 {} \;
    chmod 755 "${srcdir}/opt/${pkgname%-bin}/${pkgver}/QtWebEngineProcess"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/deploy/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
}
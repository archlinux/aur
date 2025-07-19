# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkmusicplayer-bin
_pkgname=TTKMusicPlayer
pkgver=4.2.0.0
pkgrel=1
pkgdesc="TTKMusicPlayer imitates Kugou UI, the music player uses of qmmp core library based on Qt.(Prebuilt version)支持网易云音乐、酷我音乐、酷狗音乐"
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
    'openssl-1.0'
    'qt6-virtualkeyboard'
    'qt6-declarative'
    'qt6-multimedia'
    'libpng12'
)
makedepends=(
    'p7zip'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.7z"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('f183e622961601adf662fbe703cace5df233cef86be0acc04e0c545fab907e6b'
            '26293cbcc216f141d1ec7346c225d13a14f689b4b1ab81e37da73f279082214d'
            '47c425909880e36e68f338a022b066e2a4f2f51ab4ab575532e54eca2520f779')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
        s/@pkgver@/${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -o"${srcdir}/usr/lib/${pkgname%-bin}"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/Downloads"
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type f -exec chmod 644 {} +
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type d -exec chmod 755 {} +
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type f -name "TTK*" -exec chmod 755 {} +
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgver}/QtWebEngineProcess"
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/lib/${pkgname%-bin}/deploy/share/appdata/${pkgname%-bin}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/deploy/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
}

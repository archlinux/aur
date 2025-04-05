# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=45.0.3.0
_libffmpegver=0.98.1
pkgrel=3
pkgdesc="Fast, smart and powerful browser based on Blink.(Prebuilt beta version)"
arch=('x86_64')
url="https://www.slimjet.com"
_dlurl="https://www.slimjetbrowser.com"
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
license=('LicenseRef-freeware')
depends=(
    'libxcb'
    'alsa-lib'
    'nspr'
    'nss'
    'at-spi2-core'
    'libxrandr'
    'libxcomposite'
    'libxdamage'
    'libcups'
    'cairo'
    'libxkbcommon'
    'pango'
    'libdrm'
    'mesa'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs'
    'ttf-liberation: fix fonts for some PDFs'
)
conflicts=(
    "${_pkgname}35"
    "${_pkgname}"
    "${pkgname%-bin}"
)
provides=("${_pkgname}")
options=(
    '!emptydirs'
    '!strip'
)
source=(
    #"${pkgname%-bin}-${pkgver}_amd64.deb::${url}/beta/${_pkgname}_amd64.deb"
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_dlurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('46d0cdd8d5ce35f8c76e7302e0c93d7c0c00e31ae67eadc7f43fde16e6b39256'
            '8f255929d2b91c7a2db1f2a644da84355f28dc73bc1949b1ffaedcbdaebd0ddb')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    find "${srcdir}" -type d -exec chmod 755 {} +
    find "${srcdir}" -type f -name ".gitkeep" -exec rm -rf {} +
}
pkgver() {
    grep "Version:" "${srcdir}/control" | awk '{print $2}'
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
    ln -sf "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    _icon_sizes=(16 24 32 48 64 128 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${_pkgname}/product_logo_${_icons}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps"
    done
}

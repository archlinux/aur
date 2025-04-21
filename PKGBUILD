# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=46.0.0.0
_libffmpegver=0.98.2
pkgrel=1
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
sha256sums=('5c0ad2e7a290c0f71b5833285f08b6848fe6ed0ff26c64e46b6b15737db94836'
            '071d8ccfd4678abc8b74e14fd75a7ec29ee8d5bf372f06e43885cf6005d074e9')
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
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=46.0.2.0
_libffmpegver=0.100.0
pkgrel=2
pkgdesc="Fast, smart and powerful browser based on Blink.(Prebuilt beta version)"
arch=('x86_64')
url="https://www.slimjet.com"
_dlurl="https://www.slimjetbrowser.com"
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
conflicts=(
    "${_pkgname}35"
    "${_pkgname}"
    "${pkgname%-bin}"
)
provides=("${_pkgname}")
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
    'mesa'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE'
    'ttf-liberation: fix fonts for some PDFs'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    #"${pkgname%-bin}-${pkgver}_amd64.deb::${url}/beta/${_pkgname}_amd64.deb"
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_dlurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('7cad561c62a87ac4e29880860b9ead53f82588d7ed2fed936595305616fa0b69'
            '17cda87ee9c0295553bb486300e8f68b4641afb1dc6de5c4a90be78a941eee12')
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
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
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

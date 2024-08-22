# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=44.0.1.0
_libffmpegver=0.91.0
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink"
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
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_dlurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('2b2785711d8956c460e6311878e98f6116a457b1da86349088c5bf68f31c0689'
            '0ba64e63ea05c9662a2efa5898cf4a9d0dc1ef2d09017a7849b78d058bdc51ed')
build() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    find "${srcdir}" -type f -name ".gitkeep" -exec rm -rf {} \;
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps".
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    for _icons in 16 24 32 48 64 128 256;do
        install -Dm644 "${srcdir}/opt/${_pkgname}/product_logo_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${_appname}.png"
    done
}
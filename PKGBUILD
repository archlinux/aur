# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
_pkgname="flashpeak-${pkgname}"
_libffmpegver=0.87.0
pkgver=43.0.2.0
pkgrel=3
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_dlurl="https://www.slimjetbrowser.com"
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
license=('LicenseRef-freeware')
depends=(
    'alsa-lib'
    'nspr'
    'nss'
    'at-spi2-core'
    'libxrandr'
    'libxcomposite'
    'libxdamage'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE'
    'ttf-liberation: fix fonts for some PDFs'
)
conflicts=(
    "${pkgname}"
    "${pkgname}-beta"
    "${pkgname}35"
)
install="${pkgname}.install"
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname}-${pkgver}_amd64.deb::${_dlurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('80060d9ca49c114b4e78e6dd6648bce83031fa635fdb13de88b2ed00b7d0b6ce'
            'e0d604a319b74c864ad48d632ad320a95f9b3b5b50f9d18431f18307f1208a2a')
build() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    sed "s|/usr/bin/${_pkgname}|${_pkgname}|g;s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    find "${srcdir}" -type d -exec chmod 755 {} \;
    chmod 0755 "${srcdir}/opt/${pkgname}/${pkgname}-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,/usr/bin}
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/${pkgname}/"product_logo_${_icons/x*}.png \
            "${pkgdir}/usr/share/icons/hicolopkgdirr/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml" \
        -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
}
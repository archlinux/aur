# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
_pkgname="flashpeak-${pkgname}"
pkgver=41.0.2.0
pkgrel=2
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.82.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=(
    'libxcb'
    'at-spi2-core'
    'libxdamage'
    'libxcomposite'
    'pango'
    'libxkbcommon'
    'libxrandr'
    'alsa-lib'
    'sh'
    'libxext'
    'libcups'
    'dbus'
    'nspr'
    'nss'
    'libdrm'
    'hicolor-icon-theme'
    'libxfixes'
    'expat'
    'libx11'
    'mesa'
    'cairo'
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
    "${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE.html::${url}/en/webhelp/index.htm"
)
sha256sums=('f2affe23cb8d27a1fdb9a147f5cf5962a97cdfbfa6a2600a0ebb3ca25f27b55f'
            'f68fac7117b551d0466198a5efbe65ab6cef5969bea9403eeb57ec92237fc893'
            '2c9dac1462b349e7c077ea33cdc91ff46563b2ca0457617958772a689b4c8d43')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/${_pkgname}|${_pkgname}|g;s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    find "${srcdir}" -type d -exec chmod 755 {} \;
    chmod 0755 "${srcdir}/opt/${pkgname}/${pkgname}-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/${pkgname}/"product_logo_${_icons/x*}.png \
            "${pkgdir}/usr/share/icons/hicolopkgdirr/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml" \
        -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
}
# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
_pkgname="flashpeak-${pkgname}"
pkgver=42.0.3.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.83.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('LicenseRef-freeware')
depends=(
    'libxcb'
    'at-spi2-core'
    'libxdamage'
    'libxcomposite'
    'pango'
    'libxkbcommon'
    'libxrandr'
    'alsa-lib'
    'libxext'
    'libcups'
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
    "LICENSE-${pkgver}.html::${url}/en/webhelp/index.htm"
)
sha256sums=('a83b5922db4fc6d1037ce5122b4b3198a78e1d3f9f65882088886d8825fb1989'
            '17d330079d91920e75521e9255a68b2a1bcc7d8aa84090bdce518b7160ea65e2'
            '489c5c87b68886265b8ece54cbb58f1754062d90f1546d25aa8e26e759addf62')
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/${pkgname}/"product_logo_${_icons/x*}.png \
            "${pkgdir}/usr/share/icons/hicolopkgdirr/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml" \
        -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
}
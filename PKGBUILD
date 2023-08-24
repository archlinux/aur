# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
pkgver=40.0.2.0
pkgrel=6
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.79.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=('libxcb' 'at-spi2-core' 'libxdamage' 'libxcomposite' 'pango' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'alsa-lib' 'sh' 'libxext'\
        'libcups' 'glib2' 'dbus' 'nspr' 'nss' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'expat' 'glibc' 'libx11' 'mesa' 'cairo')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=("${pkgname}35")
install="${pkgname}.install"
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE.html::${url}/en/webhelp/index.htm"
    "${pkgname}.install")
sha256sums=('97b58cbecc2ffe1b7cd20f33de7336be9aa10016edafe137b120ab6536daf263'
            '8b8af414a1c82ed63f3d4e276e42663d91af3d1a68df904da687ef2ce01b5e5d'
            '2c9dac1462b349e7c077ea33cdc91ff46563b2ca0457617958772a689b4c8d43'
            '2bfc097100279ec967fe51bd413140dfd10e095ac8005729455f9fef884723c8')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/flashpeak-${pkgname}|flashpeak-${pkgname}|g;s|Icon=flashpeak-${pkgname}|${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname}/flashpeak-${pkgname}" "${pkgdir}/usr/bin/flashpeak-${pkgname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/${pkgname}/"product_logo_${_icons/x*}.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml" \
        -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
    chmod 0755 "${pkgdir}/opt/${pkgname}/${pkgname}-sandbox"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
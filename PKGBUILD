# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
_pkgname="flashpeak-${pkgname}"
pkgver=47.0.1.0
# curl -s https://nwjs.io/versions.json | jq -r 'limit(1; .versions[] | select(.components.chromium | startswith("137.")) | .version)'
# strings src/opt/slimjet/slimjet | grep -Eo '^Chrome/([0-9]+(\.[0-9]+)+)' | head -n 1
_libffmpegver=0.99.1
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink.(Prebuilt version)"
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
    'pango'
    'cairo'
    'mesa'
    'libxkbcommon'
    'libcups'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE'
    'ttf-liberation: fix fonts for some PDFs'
)
makedepends=(
    'jq'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.deb::${_dlurl}/release/${pkgname}_amd64.deb"
    #"${pkgname}-${pkgver}.deb::${url}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('56d8aaf76ebc014cdd269cdb9e84b8ee958884b3066e67c32bc478181c5d64d6'
            'db0ffaba9e65ef018a673e9d01acc6111f1f7d2b474f0fbcdd8e190ff416c16d')
_get_versions() {
    _slimjetver="$(strings ${srcdir}/opt/${pkgname}/${pkgname} | grep -oP 'Chrome/\K[0-9]+' | head -n 1)"
    _slimjetver="${_slimjetver}."
    _ffmpegver="$(curl -s https://nwjs.io/versions.json | jq -r --arg v "${_slimjetver}" 'limit(1; .versions[] | select(.components.chromium | startswith($v))).version // empty')"
    echo -e "The chromium version of ${pkgname} is: \033[1;31m${_slimjetver}\033[0m"
    echo -e "So the ffmpeg version should be: \033[1;31m${_ffmpegver}\033[0m"
}
prepare() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    sed -i -e "
        s/\/usr\/bin\/${_pkgname}/${_pkgname}/g
        s/Icon=${_pkgname}/Icon=${pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname}.desktop"
    find "${srcdir}" -type d -exec chmod 755 {} +
    chmod 0755 "${srcdir}/opt/${pkgname}/${pkgname}-sandbox"
    sed -i "s/opt\/${pkgname}/usr\/lib\/${pkgname}/g" "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml"
    sed -i "s/opt\/${pkgname}/usr\/lib\/${pkgname}/g" "${srcdir}/usr/share/menu/${pkgname}.menu"
    _get_versions
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    _icon_sizes=(16 22 24 32 48 64 128 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${pkgname}/product_logo_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname}.xml" \
        -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
    chmod 4755 "${pkgdir}/usr/lib/${pkgname}/${pkgname}-sandbox"
}
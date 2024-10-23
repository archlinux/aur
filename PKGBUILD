# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
pkgname=slimjet
_pkgname="flashpeak-${pkgname}"
_libffmpegver=0.93.0
pkgver=44.0.5.0
pkgrel=1
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
sha256sums=('bf4f816dd91e41bd3e834c2b7a7a108c0b8867dc71dfc03562713ff1b81dfbb0'
            'f0572867da4dfc52ae9f742ea0548a2ab78a09f8fcb69d888244620da8d3e66b')
build() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    sed -e "
        s/\/usr\/bin\/${_pkgname}/${_pkgname}/g
        s/Icon=${_pkgname}/Icon=${pkgname}/g
    " -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    find "${srcdir}" -type d -exec chmod 755 {} +
    chmod 0755 "${srcdir}/opt/${pkgname}/${pkgname}-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,/usr/bin}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${pkgname}"
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
}
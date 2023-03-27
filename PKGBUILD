# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=melodie
pkgname="${_pkgname}-appimage"
pkgver=2.0.0
pkgrel=3
pkgdesc="Melodie is a portable, simple-as-pie music player"
arch=('x86_64')
url="https://feugy.github.io/melodie/"
_githuburl="https://github.com/feugy/melodie"
license=(MIT)
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
providers=(feugy)
options=(!strip)
_install_path="/opt/appimages/"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('3b841b77e3c974396e8317bcd14b7d023dfc7bd5dbc4c78f17eb53c143645dfe'
            '33ecece6203406f60b63c31a14c1d14c6217aec7c5d9564f7266403679253aca')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/melodie.AppImage/g;s/Categories=Audio/Categories=AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Gyara <laxect39@gmail.com>
_pkgname=helio
pkgname="${_pkgname}-workstation-bin"
_debname="fm.${_pkgname}.Workstation"
_appname=Helio
pkgver=3.15
pkgrel=1
pkgdesc="A free and open-source music sequencer for desktop and mobile platforms.(Prebuilt version)"
arch=('x86_64')
url="https://helio.fm/"
_ghurl="https://github.com/helio-fm/helio-sequencer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libcurl-gnutls'
    'alsa-lib'
    'libglvnd'
    'freetype2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://ci.helio.fm/${_pkgname}-${pkgver}-x64.deb"
)
sha256sums=('fda8641a7579e6c220539ad27ef231b44f00977e881021f447d5c9bbc5030aa0')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\/${_pkgname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
}
package(){
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
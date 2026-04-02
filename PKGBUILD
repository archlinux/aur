# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=himirage
pkgname="photosir-${_appname}-bin"
_pkgname="cn.photosir.${_appname}"
_armver=5.0.6.51215
_x86ver=2.0.4.51110
case "${CARCH}" in
    aarch64)
        pkgver="${_armver}"
        ;;
    x86_64)
        pkgver="${_x86ver}"
        ;;
esac
pkgrel=2
pkgdesc="A multifunctional image processing software.(Prebuilt version).悟空图像是一款多功能图像处理软件."
arch=(
    'aarch64'
    'x86_64'
)
license=('GPL-2.0-or-later')
url="https://photosir.com"
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
provides=("${pkgname%-bin}")
depends=(
    'gtk3'
    'nspr'
    'nss'
    'postgresql-libs'
    'qt5-base'
    'qt5-declarative'
    'qt5-location'
    'qt5-multimedia'
    'qt5-quickcontrols2'
    'qt5-remoteobjects'
    'qt5-sensors'
    'qt5-speech'
    'qt5-svg'
    'qt5-tools'
    'qt5-wayland'
    'qt5-webchannel'
    'qt5-webengine'
    'qt5-websockets'
    'qt5-xmlpatterns'
    'qt6-declarative'
    'qt6-multimedia'
    'unixodbc'
    'xcb-util'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'qt6-webengine'
    'libspeechd'
    'qt5-x11extras'
)
options=('!strip')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${_armver}-aarch64.deb::https://cdn.photosir.cn/package/uos/51215/${_pkgname}_${_armver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${_x86ver}-x86_64.deb::https://cdn.photosir.cn/package/uos/51110/${_pkgname}_${_x86ver}-amd64.deb")
sha256sums=('7d749594f8e9bea1f10fd4be5e95a09ebdbb23bc19754ab22d3bb626d5deae64')
sha256sums_aarch64=('8dab56c8692ce94e806f6d33bc940842c9ce21d95067e852d17fbe0477e99250')
sha256sums_x86_64=('d6a71c552c626c46c3deaf312ab7837faa4a50ee0918a4c394979d7b53b24c87')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_pkgname}\/files\/himirage.sh/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Name=${_pkgname}/Name=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_pkgname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 48x48 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/mime/packages/${_appname}-file.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

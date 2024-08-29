# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=himirage
pkgname="photosir-${_appname}-bin"
_pkgname="cn.photosir.${_appname}"
_x86ver=2.0.4.40407
_armver=2.0.6.40406
case "${CARCH}" in
    aarch64)
        pkgver="${_armver}"
        ;;
    x86_64)
        pkgver="${_x86ver}"
        ;;
esac
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
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
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${_armver}-aarch64.deb::https://cdn.photosir.cn/package/uos/40408/${_pkgname}_${_armver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${_x86ver}-x86_64.deb::https://cdn.photosir.cn/package/uos/40408/${_pkgname}_${_x86ver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('51bbd952c6be199b07734243f038670b896b2df74c23d228d583b92aeddf7036')
sha256sums_aarch64=('73c4f21148d0231fdbadb8444f5373ea696e2e5201897aa915923e6b7ee91a80')
sha256sums_x86_64=('c22b81b16da893fe67a2b8d366956f61604c3e7bd16b06bad974492a72626eb8')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/apps/${_pkgname}/files/himirage.sh|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -e "s|Name=${_pkgname}|Name=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_pkgname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/mime/packages/${_appname}-file.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
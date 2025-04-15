# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rickrack-bin
_pkgname=Rickrack
pkgver=2.9.10
pkgrel=5
pkgdesc="Generate harmonious colors freely.(Prebuilt version)焰火十二卷(实时色彩工具箱)是一款免费且实用的色彩编辑器."
arch=('x86_64')
url="https://eigenmiao.com/rickrack/"
_ghurl="https://github.com/eigenmiao/Rickrack"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'gtk3'
    'alsa-lib'
    'qt5-location'
    'qt5-multimedia'
    'qt5-tools'
    'qt5-speech'
    'qt6-quick3d'
    'qt5-remoteobjects'
    'qt5-declarative'
    'qt5-x11extras'
    'qt5-xmlpatterns'
    'qt5-wayland'
    'qt5-svg'
    'qt5-base'
    'qt5-webchannel'
    'qt5-quickcontrols2'
    'qt6-multimedia'
    'qt6-declarative'
    'libpng12'
    'tcl'
    'postgresql-libs'
    'openssl-1.0'
    'tk'
    'libxss'
    'fcitx-qt5'
    'libidn11'
    'unixodbc'
)
noextract=(
    "${pkgname%-bin}-${pkgver}-en.rpm"
    "${pkgname%-bin}-${pkgver}-zh.rpm"
)
source=(
    "${pkgname%-bin}-${pkgver}-en.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_en_linux_${CARCH}.rpm"
    "${pkgname%-bin}-${pkgver}-zh.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_zh_linux_${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('172de4c8e99f6d91cd561a8496c5e3d0a10fd64596519489665024878a8771d7'
            '1d45821e6baf37df8c4fe52f3499c666ee76cf8d57b77e5b0a10bc1ec5897efb'
            '5b626459d6d320c335fc16682ece5b05db1501038de11c290967d6c774bea76c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-zh.rpm"
	else
		bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-en.rpm"
	fi
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/MyColors"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
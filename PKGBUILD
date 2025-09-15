# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sukanka <su975853527 [AT] gmail.com>
pkgname=xunlei-bin
_appname=thunder
_debname="com.${pkgname%-bin}.download"
pkgver=1.0.0.5
pkgrel=5
pkgdesc="Xunlei download, 迅雷"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.xunlei.com/"
_dlurl="https://archive2.kylinos.cn/DEB/KYLIN_DEB/pool/all"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxtst'
    'dbus-glib'
    'gtk2'
    'alsa-lib'
    'nss'
    'libxss'
)
options=(
    '!strip'
)
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('b548c4f5388c460335cc5672c132f4dd31930c6d1cad25b0e410a69d3a9d2272'
            'a1d15b342d2c3f3a4e4dce5b978f40f814a96ab4fd7f724cde499cfbb7bcff64')
sha256sums_aarch64=('09c88aa1b6a175bb9bf9d185632fc46370d248fe867b9fdb662fcb0ee63630ec')
sha256sums_x86_64=('ef9e7cfe9d22c971dd7a53af350bdb16a039901a6bbfca0926fd7bf32b287978')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/apps/${_debname}/files/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -e "
        s/\/opt\/apps\/${_debname}\/files\/start.sh/${pkgname%-bin}/g
        s/\/opt\/apps\/${_debname}\/entries\/icons\/hicolor\/256x256\/apps\/${_debname}.png/${pkgname%-bin}/g
        s/Categories=net/Categories=Network;/g
    " -i "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop"
    sed -i "s/${_appname}x.ico/${_appname}_32.png/g" "${srcdir}/opt/apps/${_debname}/files/resources/app/out/main.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_debname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/icons/hicolor/scalable/apps/com.thunder.download.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
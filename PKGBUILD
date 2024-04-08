# Maintainer sakura1943 <1436700265@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=windterm-bin
_pkgname=WindTerm
pkgver=2.6.1
pkgrel=2
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'gtk3'
    'alsa-lib'
    'gst-plugins-base-libs'
    'xcb-util'
    'libpulse'
    'openssl-1.1'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/2.6.0/${_pkgname}_${pkgver}_Linux_Portable_${CARCH}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('2704ec7d49044a5daf531e3c4da9ca6003955b0eaae31198fa2d0facdf467e90'
            '612bb2919e8389fe46f4d8cae00d6c18ec4a3b2cfc065c12266273205b75c112')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/usr/bin/${pkgname%-bin}|${pkgname%-bin} %U|g" -i "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop"
    find "${srcdir}/${_pkgname}_${pkgver}/" -type d -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/global" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/lib" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/applets" -type f -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/commands" -type f -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/configs" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/protocols" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/schemes" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/terms" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/vendors" -type f -exec chmod 644 {} \;
    chmod 644 "${srcdir}/${_pkgname}_${pkgver}/"{license.txt,qt.conf,"${pkgname%-bin}".desktop,"${pkgname%-bin}.png"}
    chmod 755 "${srcdir}/${_pkgname}_${pkgver}/${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    chown -R "${USER}":"${USER}" "${pkgdir}/opt/${pkgname%-bin}"
}
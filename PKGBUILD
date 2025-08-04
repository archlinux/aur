# Maintainer sakura1943 <1436700265@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=windterm-bin
_pkgname=WindTerm
pkgver=2.7.0
pkgrel=2
pkgdesc="A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.(Prebuilt version)"
arch=('x86_64')
license=('Apache-2.0')
url="https://kingtoolbox.github.io/"
_ghurl="https://github.com/kingToolbox/WindTerm"
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
    "${pkgname}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_Portable_${CARCH}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('7797697eeb60239020512e2b549695a60c39b3fd01fe7ebb047fd50a2889103c'
            '0db90ad5817913f65974f446212e9cac99955770e585af10ea46dcf073d93182')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin} %U/g
        s/StartupWMClass=Code/StartupWMClass=${_pkgname}/g
    " "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop"
    find "${srcdir}/${_pkgname}_${pkgver}/terminal" -type d \( -name macos -o -name windows -o -name cmd -o -name powershell -o -name wsl \) -exec rm -rf {} +
    find "${srcdir}/${_pkgname}_${pkgver}/" -type d -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/global" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/lib" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/applets" -type f -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/commands" -type f -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/configs" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/protocols" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/schemes" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/terminal/terms" -type f -exec chmod 644 {} \;
    find "${srcdir}/${_pkgname}_${pkgver}/vendors" -type f -exec chmod 755 {} \;
    chmod 644 "${srcdir}/${_pkgname}_${pkgver}/"{license.txt,qt.conf,"${pkgname%-bin}".desktop,"${pkgname%-bin}.png"}
    chmod 755 "${srcdir}/${_pkgname}_${pkgver}/${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/temp"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_${pkgver}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm666 /dev/null "${pkgdir}/usr/lib/${pkgname%-bin}/profiles.config"
}
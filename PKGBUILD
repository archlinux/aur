# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=9.30.4
_releasedate=202403031942
pkgrel=1
pkgdesc="支持常见的主流通迅协议SSH1/SSH2/SFTP/TELNET/RLOGIN/RDP/VNC/SHELL/SERIALPORT/TCP/UDP的一个跨平台工具."
arch=("x86_64")
url="http://woterm.com/"
_ghurl="https://github.com/aoyiduo/woterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=("!strip")
depends=(
    'qt5-base'
    'postgresql-libs'
    'qt5-location'
    'qt5-declarative'
    'unixodbc'
    'openssl-1.1'
    'gtk3'
    'qt5-remoteobjects'
    'qt6-charts'
    'qt6-declarative'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://down.woterm.com/linux/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('7448cf1be61436cba1fcd2e4213d4ef2e7545b0279c595bec86155eceddb618b'
            '4147d53c8a3b51d7f1acab9fc8b9a94ca377c54c7fabf18d81dfe2b1884f6fe3')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
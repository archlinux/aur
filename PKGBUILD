# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=9.30.2
_releasedate=202402030755
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
sha256sums=('446df854a6a378c7e6e1f9b46eb1a2704b04465522d5932e04eaac6ae14ef431'
            'cb6e0a06a647a3db8a9bd3fda6bc037448965e78c229faf82230dc7fb937a7eb')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
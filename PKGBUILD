# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avaloniatftpclient-bin
_appname=TFTPClient
_pkgname="Avalonia-${_appname}"
pkgver=1
pkgrel=3
pkgdesc="Cross platform TFTP client desktop application, uses Avalonia as the UI framework.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/jpmikkers/Avalonia-TFTPClient"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'dotnet-runtime'
)
makedepends=(
    'gendesk'
    'icoutils'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/files/15011471/${_pkgname//-/}_linux_x64_net8.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jpmikkers/Avalonia-TFTPClient/v${pkgver}/LICENSE"
    "${pkgname%-bin}.ico::https://raw.githubusercontent.com/jpmikkers/Avalonia-TFTPClient/v${pkgver}/AvaloniaTFTPClient/TFTPClient/Assets/avalonia-logo.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('8fb1bc6af493f0aec4cd6f9bacd5efa40a9e427daa63e114ab9a18df7d561607'
            '7e08e464b65f43ec00cb613655de03bee0e9a9ab93d8cc350d97f774608e1cdb'
            'df9262e2176d830bfbef5b5e1dfa12f91c89e8ecb764eee366c3352df371d665'
            'd691844731820bed3c9c75d7f398e46302ba345fec56c51f1c74835cce8afe40')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    chmod +x "${srcdir}/usr/lib/${pkgname%-bin}/${_appname}"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin}"
    icotool -i 7 -x "${srcdir}/${pkgname%-bin}.ico" -o "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
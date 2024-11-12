# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rabbitremotecontrol-bin
_pkgname=RabbitRemoteControl
_debname=org.Rabbit.RemoteControl
pkgver=0.0.27
pkgrel=1
pkgdesc="Remote control. Support VNC, RDP, Terminal, SSH, TELNET etc.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/KangLin/RabbitRemoteControl"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'qt6-base'
    'qt6-webengine'
    'qt6-scxml'
    'qt6-multimedia'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('80655533f44ac00dd110a695e71522d2c9f43bb228f26da3dfc9f22599f673f8'
            'b6255be5cbf5685c1195a41cdad5a2490c403d6641c56c065040d5dbd3589aad')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Path=\/opt\/${_pkgname}/Path=\/usr\/lib\/${pkgname%-bin}/g
        s/\/opt\/${_pkgname}\/bin\/${_pkgname}.sh/${pkgname%-bin}/g
        s/${_debname}/${pkgname%-bin}/g
    " -i "${srcdir}/opt/${_pkgname}/share/applications/${_debname}.desktop"
    sed -i "s/;Path=log/Path=\/var\/log\/${pkgname%-bin}/g" "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.ini"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/bin/${_pkgname}App-${pkgver}" "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.ini" -t "${pkgdir}/usr/lib/${pkgname%-bin}/etc"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/lib/${CARCH}-linux-gnu/"* "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{plugins,share} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_debname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 -d "${pkgdir}/var/log/${pkgname%-bin}"
}
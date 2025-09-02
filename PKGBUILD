# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atrust-bin
_pkgname=aTrust
_debname="cn.com.sangfor.${pkgname%-bin}"
pkgver=2.5.16.20
_electronversion=9
pkgrel=1
pkgdesc="Sangfor ssl sdp client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.sangfor.com/"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxss'
    'qt5-base'
    'openssl-1.1'
    'java-runtime'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://atrustcdn.sangfor.com/standard/linux/${pkgver}/uos/amd64/${_pkgname}Installer_amd64.deb"
    "bsod_checker.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('fea38f63297e2c9bf853f33c566130a2f62f406926f60cf4e87f6d24a8e397d9'
            'ae82a7e0575d2ed8778134fc7d5c9c85001c955a7d26710a13101ff2363c53e6'
            '28e008479e0ddba50ab98baa97c9e27c22cfe8aaac3812f7d4552a75453068da')
prepare() {
    sed -i -e "
        s/@appname@/sangfor/g
        s/@runpath@/${_pkgname}/g
        s/@runname@/${_pkgname}Tray/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/share\/sangfor\/${_pkgname}\/${_pkgname}Tray/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/GenericName=sdp client/GenericName=${_pkgname}/g
        /packagename/d
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    rm -rf \
        "${srcdir}/usr/share/sangfor/${_pkgname}/resources/lib/libstdc++.so.6" \
        "${srcdir}/usr/share/sangfor/${_pkgname}/uem/lib/libstdc++.so.6"
    install -Dm644 "${srcdir}/bsod_checker.js" "${srcdir}/usr/share/sangfor/${_pkgname}/resources/app/src/service/bsod_checker.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/share"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/sangfor" "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/"* -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/sangfor/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/share/sangfor/.${_pkgname}"
    chown -R "${USER}:${USER}" "${pkgdir}/usr/share/sangfor/.${_pkgname}"
}
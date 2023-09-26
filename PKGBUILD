# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ahmyth-bin
_appname=AhMyth
pkgver=1.0_beta.5a
pkgrel=2
pkgdesc="Cross-Platform Android Remote Administration Tool"
arch=("i686" "x86_64")
url="https://github.com/Morsmalleo/AhMyth"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron11-bin' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}.sh")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver//_/-}/${_appname}-Setup_ia32.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver//_/-}/${_appname}-Setup_amd64.deb")
sha256sums=('0817b58865f2e8e24579d699ab95a6c29029073da844859b70951b8d470fcbb6')
sha256sums_i686=('16458a927945401f312d4752fbca33e8e9df8c1203083e81041cc5fb3b5fb838')
sha256sums_x86_64=('a9f1630c23bdc1320361b021353f923fd72942e48c9ae8dc6d8b5de067f39335')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eagle-animation-bin
_appname="Eagle Animation"
pkgver=2.3.1
pkgrel=2
pkgdesc="An awesome, free and open-source animation software."
arch=('x86_64')
url="https://brickfilms.com/"
_githuburl="https://github.com/brick-a-brack/eagle-animation"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('c394b441cd06bbe775d219a0aa7bf5c7f00e3f1abc4e810bc841e14ffb6b3b2a'
            'b82d659ef3eecaa3c9f77c928f618805b3482fafaa9007c0af10993c2f1a011f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
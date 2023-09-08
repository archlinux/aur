# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zhiximind-desktop-bin
pkgver=2.1.3.1
pkgrel=1
pkgdesc="知犀思维导图官方版"
arch=('x86_64')
url="https://www.zhixi.com"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::https://cdn-resource.zhixi.com/application/soft_package/channel/80004201/21C8B557/software/${pkgver}/jIgnVa/zhixilinux_21C8B557.deb"
    "LICENSE.html::${url}/user-agreement"
    "${pkgname%-bin}.sh")
sha256sums=('972aed41c6a54acf99f0ccb60047f52ba9fe264fbee04a9a0c4746df7a33eb53'
            'f01b6dfa93df1dd1648cc85a728a497be1c1a7c2ecfa601e2bce16bb20653410'
            '0c9ab1ee4add82205f5313762320db41ea05a7bd77ca34e8c53f3b52620f955b')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
    cp "${srcdir}/app.asar.unpacked/resources/icons.iconset/icon_32x32.png" "${srcdir}/app.asar.unpacked/resources/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
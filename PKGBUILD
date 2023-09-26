# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-bin
_appname="Frappe Books"
pkgver=0.18.0
pkgrel=2
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "frappebooks")
depends=('electron18-bin' 'hicolor-icon-theme' 'bash' 'gcc-libs' 'glibc')
makededpends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('f4b74b5fff75e89380b4a8deb20573cbb1c4dc43e52c5a249f05fc47a3769048'
            '979fa8d61b7c359499ea139044294bfcfe96d59afdb534cd3b03eddf9d6e97b0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/opt/${_appname}/resources/app.asar.unpacked"
    asar p "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g;s|Finance|Finance;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_appname}/templates/"*.html -t "${pkgdir}/opt/${pkgname%-bin}/templates"
    install -Dm644 "${srcdir}/opt/${_appname}/translations/"*.csv -t "${pkgdir}/opt/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/opt/${_appname}/creds/log_creds.txt" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"*.so -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
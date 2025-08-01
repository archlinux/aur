# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Martin
# Contributor: Adam Rustler
pkgname=prepros-bin
_pkgname=Prepros
pkgver=7.27.0
_electronversion=25
pkgrel=1
pkgdesc="Prepros compiles your files, transpiles your JavaScript, reloads your browsers and makes it really easy to develop & test your websites so you can focus on making them perfect.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://prepros.io"
license=('LicenseRef-custom')
depends=(
    "electron${_electronversion}"
    'perl'
    'ruby'
    'libva>=2.20.0'
    '7zip'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://downloads.prepros.io/v7/${pkgver}/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('37590c8b560a2eca91adda708246fb2d3f6c6d9b57d8147ed79406092d029933'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}-7/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@prepros/node/node_modules/7zip-bin/"{linux/{arm*,ia32},mac,win} \
        "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@prepros/ruby/node_modules/7zip-bin/"{linux/{arm*,ia32},mac,win} \
        "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@sbspk/mozjpeg-bin/vendor/"{darwin-*,win32-*} \
        "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@sbspk/pngquant-bin/vendor/"{darwin-*,win32-*}
    ln -sf "/usr/bin/7za" "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@prepros/node/node_modules/7zip-bin/linux/x64/7za"
    ln -sf "/usr/bin/7za" "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/@prepros/ruby/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
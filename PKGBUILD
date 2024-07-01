# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anklang-bin
pkgver=0.3.0
_electronversion=31
pkgrel=1
pkgdesc="A digital audio synthesis application for live creation and composition of music and other audio material."
arch=('x86_64')
url="https://github.com/tim-janik/anklang"
license=("MPL-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'flac'
    'pipewire-jack'
    'gtk2'
    'opus'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('e96dcf5f29c3bd286e2d0f9262821c42cc17d61916a832ea36f94ebfa557b861'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\/\/lib\/${pkgname%-bin}-0-3\/bin\/${pkgname%-bin}|${pkgname%-bin}|g;s|${pkgname%-bin}/electron|${pkgname%-bin}|g" \
        -i "${srcdir}/share/applications/${pkgname%-bin}.desktop"
    sed "s|__dirname + '/../../../lib/AnklangSynthEngine'|'./lib/AnklangSynthEngine'|g" \
        -i "${srcdir}/lib/${pkgname%-bin}-0-3/electron/resources/app/main.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/lib/${pkgname%-bin}-0-3/electron/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/lib/${pkgname%-bin}-0-3/"{doc,lib,ui} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/share/doc/${pkgname%-bin}/"*.* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    cp -r "${srcdir}/share/doc/${pkgname%-bin}/style" "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    ln -sf "/usr/lib/libFLAC.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libFLAC.so.8"
}
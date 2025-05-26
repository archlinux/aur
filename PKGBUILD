# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anklang-bin
pkgver=0.3.0
_electronversion=31
pkgrel=4
pkgdesc="A digital audio synthesis application for live creation and composition of music and other audio material.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://anklang.testbit.eu/"
_ghurl="https://github.com/tim-janik/anklang"
license=('MPL-2.0')
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('e96dcf5f29c3bd286e2d0f9262821c42cc17d61916a832ea36f94ebfa557b861'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/\/lib\/${pkgname%-bin}-0-3\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
        s/${pkgname%-bin}\/electron/${pkgname%-bin}/g
    " "${srcdir}/share/applications/${pkgname%-bin}.desktop"
    sed -i "s/__dirname \+ \'\/..\/..\/..\/lib\/AnklangSynthEngine\'/\'.\/lib\/AnklangSynthEngine\'/g" \
        "${srcdir}/lib/${pkgname%-bin}-0-3/electron/resources/app/main.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/lib/${pkgname%-bin}-0-3/electron/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/lib/${pkgname%-bin}-0-3/"{doc,lib,ui} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/share/doc/${pkgname%-bin}/"*.* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/share/doc/${pkgname%-bin}/style" "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    ln -sf "/usr/lib/libFLAC.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libFLAC.so.8"
}
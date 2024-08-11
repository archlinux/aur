# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisqi-bin
_pkgname=Brisqi
pkgver=0.12.1
_electronversion=31
pkgrel=1
pkgdesc="Offline-first personal Kanban app."
arch=('x86_64')
url="https://brisqi.com/"
_ghurl="https://github.com/Brisqi/releases"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}.html::${url}/terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('a3d79661f404813d2dfdbd3a7ec29d506d7f0a194a19ee51f17ae63531baaa70'
            '657a86267eec01065fcceb2af12d005f70d8baf8ceb4519015e2679d86cc3f52'
            'c053a7b3ed8b0b4d77f78e81ab8a4c61cbfd773a9298b3f3a187e5df89c125c2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 38x38 64x64 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}//LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

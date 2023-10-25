# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=onote-bin
_pkgname=ONote
pkgver=0.10.0
pkgrel=1
pkgdesc="Markdown笔记应用，基于monaco-editor，支持本地及SSH数据源"
arch=("x86_64")
url="https://github.com/pansinm/ONote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/pansinm/ONote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0a9ffd9d0fed0147c838b1ecb8fdedef70de2c15b7874ff02a1cdcf597d6999f'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5'
            'ef645f02c32705ca69bb4d4c2e37906999248097f96bb963bfa9ef0cdbcca0e3')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
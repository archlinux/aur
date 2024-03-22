# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=miteiru-bin
pkgver=2.2.0
_electronversion=21
pkgrel=7
pkgdesc="An open source Electron video player to learn Japanese. It has main language dictionary and tokenizer (morphological analyzer), heavily based on External software MeCab"
arch=('x86_64')
url="https://github.com/hockyy/miteiru"
license=("CC-BY-NC-4.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'mecab'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-22.04-amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/hockyy/miteiru/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('88a1a9c7a05986f34d65adad6a6430cd7931c25442750b68706d025143ad83ca'
            '32b8056672bc415bbd3829a9a737d776795f6b73af61ce0934107ed81ee8a7a0'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
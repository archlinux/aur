# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tjmc-launcher-bin
_pkgname=TJMC-Launcher
pkgver=0.2.7
_electronversion=23
pkgrel=3
pkgdesc="A simple to use, extremely fast, and well supported app, that allows you to install pure and modded versions of Java Minecraft."
arch=(
    'aarch64'
    'x86_64'
)
url="https://launcher.tjmc.ru/"
_ghurl="https://github.com/tjmcraft/TJMC-Launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tjmcraft/TJMC-Launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1a25e3b0f4bf16543e5f802cf6d9d189bcae27617ca8be936ad866a8955d9ce6'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('56b47b4d68367661f3e0b6a42b96c916b091908b420158e5b3d0df1e04941358')
sha256sums_x86_64=('b4a0666c537e9e172748d785196a8d99698244ba25d9dffc5c0f55375a188ce9')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
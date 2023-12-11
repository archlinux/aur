# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tjmc-launcher-bin
_pkgname=TJMC-Launcher
pkgver=0.2.2
_electronversion=23
pkgrel=1
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
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('9df087cb629bf27c0e333b48046a723862c0bb79d0bfe67b6b0e6567e911cc6a')
sha256sums_x86_64=('5392aedace5ab5dd59894dfd0d6e542b3bc610533a9d0220b5fce5d6a5dfd69b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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
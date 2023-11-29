# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tjmc-launcher-bin
_pkgname=TJMC-Launcher
pkgver=0.1.2101
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
    'electron23'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tjmcraft/TJMC-Launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1a25e3b0f4bf16543e5f802cf6d9d189bcae27617ca8be936ad866a8955d9ce6'
            'a99e67b077a4a23e520296db9ddd7851f93f08709e461c02c79298a47bde7d90')
sha256sums_aarch64=('5af70ff5040e990bd698160c1e952123275ce1530e21a80658f7a53d0c97df7a')
sha256sums_x86_64=('3ccc3d43a7c703a35c6019a458e6d68961611e5f9906596c20b813cd3170870f')
build() {
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
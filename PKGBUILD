# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
pkgname=vencord-desktop-bin
_appname=vencorddesktop
_pkgname=Vesktop
_assetname=VencordDesktop
pkgver=0.4.4
_electronversion=27
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_assetname}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('78fa56b7d32c691877b1a955037e87622657e627cbc112b8f5114f8b620415d3')
sha256sums_aarch64=('3250774bb3d2b5a11045c4814f572e9ca58efc975b25aa84559736452d4b5a78')
sha256sums_x86_64=('b08f769ee19d32e27301ace10f0034594e364a1cf5bad4260d401d1eea3accaa')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname} %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
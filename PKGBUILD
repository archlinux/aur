# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: HentaiShiroYuki <hentaishiroyuki at gmail dot com>
# Contributor: Sofia Lima
_pkgname=Vesktop
pkgname=vesktop-bin
_appname=vencord-desktop
pkgver=1.5.0
_electronversion=28
pkgrel=1
pkgdesc="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('d4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('cab6b72a969c759e305d6d7b4d499a30cb03df0da16e878393e71937fe1894b4')
sha256sums_x86_64=('e64d144156fdbfc2525158dfaeaa8b0a0dd84e2c55eeab0456fc47514fab9932')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=e-search-bin
_pkgname=eSearch
pkgver=14.0.1
_electronversion=31
pkgrel=1
pkgdesc="Screenshot,OCR search,translate,search for picture paste the picture on the screen,screen recorder.Use system-wide electron.截屏,离线OCR,搜索翻译,以图搜图,贴图,录屏,滚动截屏."
arch=(
    'aarch64'
    'x86_64'
)
url="https://esearch-app.netlify.app/"
_ghurl="https://github.com/xushengfeng/eSearch"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname//S/s}-electron"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
    'libxt'
    'xdg-utils'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('899791e8be03409b3cf85a5a49db663ca288e4a8ef1436db9d23dc170effb983')
sha256sums_x86_64=('4f1f7e4bdfb7dee621f50a4585b287e8bbc7d8d6148e4e595881710db6969fb4')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/;s/${_pkgname//S/s}/${pkgname%-bin}/" \
        "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
}
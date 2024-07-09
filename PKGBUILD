# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=e-search-bin
_pkgname=eSearch
pkgver=1.12.1
_electronversion=22
pkgrel=1
pkgdesc="截屏,离线OCR,搜索翻译,以图搜图,贴图,录屏,滚动截屏.Screenshot,OCR search,translate,search for picture paste the picture on the screen,screen recorder.Use system-wide electron."
arch=('x86_64')
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
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://github.com/xushengfeng/eSearch/releases/download/1.11.0/eSearch-1.11.0-linux-x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2a8924413943e458a77bdb8518bd2633ab0755f2dc66d6925981ed0dfb7b9c85'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_pkgname//S/s}|${pkgname%-bin}|g;s|${_pkgname//S/s}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname//S/s}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//S/s}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname//S/s}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname//S/s}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
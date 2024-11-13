# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=clouddm
pkgname="${_appname}-personal-bin"
_pkgname=CloudDM
pkgver=2.9.0
_electronversion=22
pkgrel=1
pkgdesc="One-stop multi-source development management tool.(Prebuilt version.Use system-wide electron)一站式多数据源开发管理工具"
arch=('x86_64')
url="https://www.clougence.com/clouddm-personal"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'java-runtime'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_dlurl}/releases/download/${_pkgname}${pkgver}/${_pkgname}-v${pkgver}.AppImage"
    "LICENSE.html::https://www.clougence.com/cc-doc/protocol/terms_of_use"
    "${pkgname%-bin}.sh"
)
sha256sums=('4eafd3a5cbd0f25950a73b4a150b031b9b37b0e9c1762b120181495cc7ec0e59'
            '343936e6d2fe9819c90fcd27d696c98de0b116f915bd303b59d21cf0d1121da7'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/resources\/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g;s/Utility/Development/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"{bin,cgr,drivers,libs,plugins,resources} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
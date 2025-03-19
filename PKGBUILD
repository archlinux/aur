# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=js.design
pkgname="${_pkgname//./-}-electron-bin"
pkgver=1.0.7
_electronversion=15
pkgrel=4
pkgdesc="A professional UI design software tailored for Chinese designers.(Prebuilt version.Use system-wide electron)即时设计"
arch=('x86_64')
url="https://js.design"
license=("LicenseRef-custom")
conflicts=("${_pkgname//./-}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://img.js.design/assets/download/%E5%8D%B3%E6%97%B6%E8%AE%BE%E8%AE%A1%20Linux%E7%89%88.AppImage"
    "LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('3697482be454c0191810f39b0b93eb3c28eb5e9c77c6c3ad0634269f8e1a2bd5'
            'f1c8afcb7fbd3ad91d1f8b4bea8d66a21f9cb85be22b16ce652b66ca9473c616'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/squashfs-root"
    grep "X-AppImage-Version" "${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//g"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
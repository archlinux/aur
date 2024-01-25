# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xplist-bin
_pkgname=Xplist
pkgver=1.2.47
pkgrel=4
pkgdesc="Cross-platform Plist Editor"
arch=("x86_64")
url="https://github.com/ic005k/Xplist"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    'libglvnd'
    'libgpg-error'
    'freetype2'
    'libx11'
    'fontconfig'
    'e2fsprogs'
    'libxcb'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Xplist/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9319fd1f4ccda8abe34ab18390f3cd81d69c442c5030f7583e59c8bc4c1395eb'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b'
            '0e6306f7441484b79d75e949fb7ac69418a49face3f038deda3407c3e26c0ebc')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g;s|icon|${pkgname%-bin}|g;s|Application;|Utility;|g" -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
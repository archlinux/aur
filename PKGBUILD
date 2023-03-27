# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=museeks
pkgname="${_pkgname}-appimage"
pkgver=0.13.1
pkgrel=2
pkgdesc="A simple, clean and cross-platform music player"
arch=("x86_64")
url="https://museeks.io/"
_githuburl="https://github.com/martpie/museeks"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=(martpie)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('2efba7842166a6fd344e75f35a3a779105008682a99a9ea9a8a81c694a9957ea'
            '6f09c1eea17a3c9d1b6ad335090a9b102552079a15e4de1fc5d106c401106ba4')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/museeks.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

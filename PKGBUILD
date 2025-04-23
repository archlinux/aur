# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=caesium-image-compressor-bin
_pkgname='Caesium Image Compressor'
pkgver=2.6.0
pkgrel=2
pkgdesc="An image compression software that helps you store, send and share digital pictures, supporting JPG, PNG, WebP and TIFF formats.(Prebuilt version)"
arch=('x86_64')
url="https://saerasoft.com/caesium#downloads"
_ghurl="https://github.com/Lymphatus/caesium-image-compressor"
_dlurl="https://github.com/larygwil/caesium-image-compressor"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'gmp'
    'libglvnd'
    'zlib'
    'libx11'
    'libxcb'
    'libgpg-error'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_dlurl}/releases/download/v${pkgver}/${_pkgname// /_}-${CARCH}_v${pkgver}_ubu20_qt66.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('549b026616d0992a5d34a4fe09782af450437046d622b03ad9451b197b3e7495'
            'bf28379cb0ba33a297560e1e50c2ae13504487be2e8ebb39b899f48b442886f0')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/logo/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/icon.iconset/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
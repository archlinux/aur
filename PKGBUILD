# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mdview-bin
pkgver=3.2.0
_electronversion=33
pkgrel=1
pkgdesc="Standalone Markdown viewer."
arch=('x86_64')
url="https://github.com/c3er/mdview"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/c3er/mdview/v${pkgver}/LICENSE"
)
sha256sums=('5cf93dfb098f2f6cb6c061cd9bd34c64c039d049811c704725f597b3bbd841d5'
            '4014420ba4b48c5f19ac8645ebeec93b9a0ccd41359700efc8b4d83738d16eeb')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/squashfs-root/${_files}"
	done
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/"{"${pkgname%-bin}.desktop","${pkgname%-bin}.png",usr,LICENSE*}
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
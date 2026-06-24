# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vgmtrans-bin
_pkgname=VGMTrans
pkgver=1.1
pkgrel=6
pkgdesc="A tool to convert proprietary, sequenced videogame music to industry-standard formats.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/vgmtrans/vgmtrans"
license=('Libpng')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libice'
    'libglvnd'
    'libx11'
    'harfbuzz'
    'libsm'
    'fontconfig'
)
options=("!strip")
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-preview-v${pkgver}.AppImage"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/vgmtrans/vgmtrans/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('a9d94aedde9992602fb1b93093783d236a8310a71227b2dd0597914deb4a89bc'
            '3204441b667402c3720e32139a48fcb32d4c5dc7c2e464de415b24b9185adb7c'
            '574c9abedf1d4ff7d577a1e180faffeab850eb2aa4eaff000946025787185895')
build() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin} %U/g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/"{bin,lib,plugins} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ratssearch
pkgname="${_appname//ss/s-s}-bin"
_pkgname=RatsSearch
pkgver=2.0.12
pkgrel=1
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/librats/rats-search"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'libgpg-error'
    'libglvnd'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x64-v${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/librats/rats-search/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a9538d23eab45c87c25925be9b72705851620d85d60bc8d392be2db04dbf4c65'
            'fa6a25af037d88ee811669579da9674e5694611599600b11e691115054f6fe2f'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

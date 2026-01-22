# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netsonar-bin
_pkgname=NetSonar
_debname="pt.ptrtech.${_pkgname}"
pkgver=0.2.3
pkgrel=1
pkgdesc="A network diagnostics tool for pinging hosts (ICMP/TCP/UDP/HTTP), managing network interfaces, and discovering local devices/services(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/sn4k3/NetSonar"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'glibc'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}_linux-arm64_v${pkgver}.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}_linux-x64_v${pkgver}.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('587630b858a37bc5b30f31af8d7e7f40c8c3b3cc3c2835278fabc13c79860485')
sha256sums_aarch64=('9249b1ba66bbb5baa7089d18fbc120ef79a4b7eb88d5c5787143a5cd608d1041')
sha256sums_x86_64=('4773606d8ab1591ecd07623b70ae2fc70626c2b23f0b9a81d34fe77e71762ddd')
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
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/bin" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_debname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}

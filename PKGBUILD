# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
#_getverurl="https://github.com/flathub/com.hunterwittenborn.Celeste/blob/master/com.hunterwittenborn.Celeste.yml"
_pkgname=celeste
pkgname="${_pkgname}-client-bin"
_appname=com.hunterwittenborn.Celeste
pkgver=0.8.1
_snap="a9zAmHVl4doDwIGkptVyA7VI7fMlPPpE_34"
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider "
arch=('x86_64')
url="https://github.com/hwittenborn/celeste"
license=('GPL-3.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_pkgname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'libadwaita'
    'rclone'
)
makedepends=(
    'squashfs-tools'
)
source=()

source=("${pkgname%-bin}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap}.snap")
sha256sums=('fd2a6eb205b028060f3e7c1703d1c0a46f2b470c1f6c17c637d2ed4e1f25ab69')
build() {
    unsquashfs -f "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -D "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/app/${pkgname%-bin}.svg"
}
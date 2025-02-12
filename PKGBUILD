# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pgdm-ui-bin
_pkgname=PostGres.Data.Management
pkgver=1.0.0
_electronversion=31
pkgrel=1
pkgdesc="Electron App for PGDM.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ucd-library/pgdm-ui"
license=(
    'MIT'
    'CC0-1.0'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'squashfs-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}.snap::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.snap"
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/ucd-library/pgdm-ui/${pkgver}/LICENSE"
    "LICENSE-CC0-1.0-${pkgver}.md::https://raw.githubusercontent.com/ucd-library/pgdm-ui/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('169c2526f65c61854e44d27f386c9de67fd3ede3fc28d0f41dc3ea380bd68a75'
            '02cde0ac7aac7c4f4b148b031f4233fd1ac9caa97ad1c82bec6167086c2da840'
            '33c4de6d76721945c9346b3b1024fe56f2fbb6bebbb0e761656232520a6defa6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/@ucd-lib/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    unsquashfs -f "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    sed -i "s/\${SNAP}\/meta\/gui\/icon.png/${pkgname%-bin}/g" "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/LICENSE-CC0-1.0-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC0-1.0.md"
}
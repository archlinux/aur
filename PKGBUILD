# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyedit-bin
_pkgname=EasyEdit
pkgver=1.4.2
_electronversion=38
pkgrel=1
pkgdesc="An easy markdown editor that allows you to write MarkDown (MD) and preview it in real-time. You can save, load .md files and export to PDF.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/gcclinux/EasyEdit"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'squashfs-tools'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/EasyEdit/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.snap::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64.snap")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.snap::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-armhf.snap")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.snap::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.snap")
sha256sums=('2b94523fd0d3fd7553fcdd10250f68ed5c058749d5d60c8aae906f6f42ace489'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('413d6c5303787029cecf33ac713993450c9af3d0466f3c6a50bf8e831dd97fb6')
sha256sums_armv7h=('4bab1df4170cfc9ecac56625db5f5782a172f2788abca56d1357d999aaed5c24')
sha256sums_x86_64=('7a2ed2b24c86e3b224b2d988b8dfd5cb866b3630668500af03c5e245219cef30')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    unsquashfs "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.snap"
    _get_electron_version
    sed -i "s/\${SNAP}\/meta\/gui\/icon.png/${pkgname%-bin}/g" "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"{app.asar,"${pkgname%-bin}.png"} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/resources/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t"${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
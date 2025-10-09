# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyedit-bin
_pkgname=EasyEdit
pkgver=1.4.1
_electronversion=38
pkgrel=1
pkgdesc="An easy markdown editor that allows you to write MarkDown (MD) and preview it in real-time. You can save, load .md files and export to PDF.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
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
    "${pkgname%-bin}-${pkgver}-x86_64.snap::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-amd64.snap"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/EasyEdit/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('dff5bc9ce3cd1478d0dad11b2d029d028175032bcc31adc22bf74b0e9e44080b'
            '2b94523fd0d3fd7553fcdd10250f68ed5c058749d5d60c8aae906f6f42ace489'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
    #if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
    #    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    #fi
    #"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    unsquashfs "${srcdir}/${pkgname%-bin}-${pkgver}-x86_64.snap"
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

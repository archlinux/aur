# Maintainer: PancakeTAS <pancake@mgnet.work>

_pkgname=spplice
pkgname=${_pkgname}-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="The first ever dedicated Portal 2 mod launcher"
arch=('x86_64')
url="https://www.p2r3.com/spplice/"
license=('unknown')
depends=('electron23')
options=(!strip !debug)
_appimage="${_pkgname}.AppImage"
source=(
  "https://www.p2r3.com/spplice/app/${_appimage}"
  "spplice-launcher.sh"
)
sha512sums=(
    "b708b63fa6ae278636547f1c9b1f884674b3ed7c8b06c7d9b1de5684fe354fcf7d437c6b0afd6ca95b73fddc3d9ac3c473b835d3494dcc62d155920193a6b583"
    "35f99141441bf76fa55f8b313c0a149bc0f8772bfea39d1b3cc156539886f3f482c33dad791441930576fd3c4d46d3fecef47b776ed9b283b034cffd27fa4850"
)
noextract=("${_appimage}")

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_pkgname}.desktop
    ./${_appimage} --appimage-extract ${_pkgname}.png
    ./${_appimage} --appimage-extract usr/share/icons
    ./${_appimage} --appimage-extract resources/app.asar
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
}

package() {
    install -Dpm644 "squashfs-root/resources/app.asar" "${pkgdir}/opt/${_pkgname}/app.asar"
    install -Dpm755 "spplice-launcher.sh" "${pkgdir}/opt/${_pkgname}/spplice-launcher.sh"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/spplice-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

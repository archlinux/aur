# Maintainer: PancakeTAS <pancake@mgnet.work>

_pkgname=spplice
pkgname=${_pkgname}-bin
pkgver=2.0.5
pkgrel=2
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
    "d46eaa6300930a4fb4abc5e39baef793861096c6a34e13036e83ae7a15a77de830120576133a5654dd95ae97c55f141342a914a0dd56096ede5c1ac84653041b"
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

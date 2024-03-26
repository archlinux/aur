# Maintainer: PancakeTAS <pancake@mgnet.work>

_pkgname=spplice
pkgname=${_pkgname}-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="The first ever dedicated Portal 2 mod launcher"
arch=('x86_64')
url="https://www.p2r3.com/spplice/"
license=('unknown')
depends=('zlib' 'fuse2')
options=(!strip !debug)
_appimage="${_pkgname}.AppImage"
source=("https://www.p2r3.com/spplice/app/${_appimage}")
sha512sums=("d46eaa6300930a4fb4abc5e39baef793861096c6a34e13036e83ae7a15a77de830120576133a5654dd95ae97c55f141342a914a0dd56096ede5c1ac84653041b")
noextract=("${_appimage}")

prepare() {
    chmod +x ${_appimage}    
    ./${_appimage} --appimage-extract ${_pkgname}.desktop
    ./${_appimage} --appimage-extract ${_pkgname}.png
    ./${_appimage} --appimage-extract usr/share/icons
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

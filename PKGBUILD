# AUR Maintainer: Malthbern
# Contributers: AstroDogeDX, kafeijao, Malthbern

_pkgname=cvrx
pkgname=${_pkgname}-appimage
pkgver=1.0.14
pkgrel=1
pkgdesc='A standalone companion app for ChilloutVR that expands the user experience! (binary AppImage version)'
arch=('x86_64')
url='https://github.com/AstroDogeDX/CVRX'
license=('MIT')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("https://github.com/Malthbern/CVRX-Linux/releases/download/v${pkgver}/${_appimage}")
sha256sums=('070de02ab69a7f35c62922c11dbd654272fa103ad0c12173835a397a2e05527d')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp ${_appimage} ${_appimage}.copy
    chmod +x ${_appimage}.copy
    ./${_appimage}.copy --appimage-extract
    rm ${_appimage}.copy
    find squashfs-root/ \! -type d -exec rename ${_pkgname} ${_pkgname} \{\} \;
    find squashfs-root/ -type l -exec rename --symlink ${_pkgname} ${_pkgname} \{\} \;
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|Name=.*$|Name=CVRX|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|^Icon=.*$|Icon=${_pkgname}|" squashfs-root/${_pkgname}.desktop
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}

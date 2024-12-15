# Maintainer: Jan-Niklas Tomski <jan-niklas at tomski dot me>
_pkgname=wootility
pkgname=${_pkgname}5-beta
pkgrel=1
pkgver='5.0.0_beta.3'
_appimage="${_pkgname^}-${pkgver//_/-}.AppImage"
pkgdesc="Utility for configuring Wooting keyboards (v${pkgver//_/-})"
arch=(any)
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=("https://wootility-updates.ams3.cdn.digitaloceanspaces.com/wootility-linux/${_appimage}"
        '70-wooting.rules')
b2sums=('75e5ddf03424eeca2db7d9a2b92480202d2030b1980bf93c242cc1c26d1bd33d54a8ddf4ed267211751a6ce3b10a3e0c84ac5d282101963997fccd2b98ac6852'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp ${_appimage} ${_appimage}.copy
    chmod +x ${_appimage}.copy
    ./${_appimage}.copy --appimage-extract ${_pkgname}.desktop
    ./${_appimage}.copy --appimage-extract ${_pkgname}.png
    ./${_appimage}.copy --appimage-extract usr/share/icons
    rm ${_appimage}.copy
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|Name=.*$|Name=Wootility|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|^Icon=.*$|Icon=${_pkgname}|" squashfs-root/${_pkgname}.desktop
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    # Install udev rules
    install -Dpm644 "70-wooting.rules" "${pkgdir}/usr/lib/udev/rules.d/70-${_pkgname}.rules"
}

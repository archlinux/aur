# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility3
pkgname=${_pkgname}-appimage
pkgver=3.6.16
pkgrel=2
pkgdesc='Utility for configuring Wooting pre-Lekker keyboards (binary AppImage version)'
arch=('x86_64' 'x86_64_v3')
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('findutils' 'util-linux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname%3}-${pkgver}.AppImage"
install=$pkgname.install
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-linux-latest/${_appimage}"
        '70-wooting.rules')
b2sums=('79a32462cb3f375344ace2a4785c950854b8a7dd027d9c1e7c24696135f641d1d88f56ccbc2dfadc53d278e291bf11735d81d860e57b83cb981366d4930bf641'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp ${_appimage} ${_appimage}.copy
    chmod +x ${_appimage}.copy
    ./${_appimage}.copy --appimage-extract ${_pkgname%3}.desktop
    ./${_appimage}.copy --appimage-extract ${_pkgname%3}.png
    ./${_appimage}.copy --appimage-extract usr/share/icons
    rm ${_appimage}.copy
    find squashfs-root/ \! -type d -exec rename ${_pkgname%3} ${_pkgname} \{\} \;
    find squashfs-root/ -type l -exec rename --symlink ${_pkgname%3} ${_pkgname} \{\} \;
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|Name=.*$|Name=Wootility 3|" squashfs-root/${_pkgname}.desktop
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

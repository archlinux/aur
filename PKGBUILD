# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility
pkgname=${_pkgname}-appimage
pkgver=4.6.14
pkgrel=2
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64' 'x86_64_v3')
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}" "${_pkgname}-lekker")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="${_pkgname}-lekker-${pkgver}.AppImage"
install=$pkgname.install
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-latest/${_appimage}"
        '70-wooting.rules')
b2sums=('c34309b02279ff36c0bdf68d7004f59d9d83e5f906d2c111a8677df5f5835aacf55dd51b701c90308585c75e43b6aab27e1b52bd8a24e186c6a5e5bbf80f483a'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp ${_appimage} ${_appimage}.copy
    chmod +x ${_appimage}.copy
    ./${_appimage}.copy --appimage-extract ${_pkgname}-lekker.desktop
    ./${_appimage}.copy --appimage-extract ${_pkgname}-lekker.png
    ./${_appimage}.copy --appimage-extract usr/share/icons
    rm ${_appimage}.copy
    find squashfs-root/ \! -type d -exec rename ${_pkgname}-lekker ${_pkgname} \{\} \;
    find squashfs-root/ -type l -exec rename --symlink ${_pkgname}-lekker ${_pkgname} \{\} \;
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
    sed -i -E "s|Name=.*$|Name=Wootility|" squashfs-root/${_pkgname}.desktop
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

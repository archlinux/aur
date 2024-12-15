# Maintainer: Jan-Niklas Tomski <jan-niklas at tomski dot me>

_pkgname=wootility
_versionmain=5.0.0
_versionbeta=beta.2
_pkgver="${_versionmain}-${_versionbeta}"
_appimage="Wootility-${_pkgver}.AppImage"
pkgname=${_pkgname}5-beta
pkgver="${_versionmain}${_versionbeta}"
pkgrel=1
pkgdesc="Utility for configuring Wooting keyboards (v${_pkgver})"
arch=(any)
url='https://wooting.io/wootility'
license=('unknown')
groups=()
depends=('fuse2')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
source=("https://wootility-updates.ams3.cdn.digitaloceanspaces.com/wootility-linux/${_appimage}"
        '70-wooting.rules')
noextract=()
b2sums=('291d2bf07b2f3db91632168cdb0dae3e8860718af74f82d0eb9b13bfdc2cb170af997542820f96d4fa8c9a0617a69760d5b9323261dc19152222fc3a00fff038'
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

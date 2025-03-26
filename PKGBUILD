# Maintainer: Jan-Niklas Tomski <jan-niklas at tomski dot me>
_pkgname='wootility'
pkgname="${_pkgname}5-appimage"
pkgver='5.0.5'
_appimage="${_pkgname^}-${pkgver}.AppImage"
pkgrel=1
pkgdesc="Utility for configuring Wooting keyboards (v${pkgver//_/-})"
arch=(any)
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'wootility5-beta' 'wootility-appimage' 'wootility3-appimage')
options=(!strip)
source=("https://wootility-updates.ams3.cdn.digitaloceanspaces.com/wootility-linux/${_appimage}"
        '70-wooting.rules')
b2sums=('f42c100eb893b4b87f0b4646fcdc178f1c68567172cb0c015b4501d0f2439b70136b650fa9611e11eca6500a60f63bdd6c3f11db8b8522e8158f258fa6b3bcf5'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp "${_appimage}" "${_appimage}.copy"
    chmod +x "${_appimage}.copy"
    "./${_appimage}.copy" --appimage-extract "${_pkgname}.desktop"
    "./${_appimage}.copy" --appimage-extract "${_pkgname}.png"
    "./${_appimage}.copy" --appimage-extract usr/share/icons
    rm "${_appimage}.copy"
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
    sed -i -E "s|Name=.*$|Name=${_pkgname^}|" "squashfs-root/${_pkgname}.desktop"
    sed -i -E "s|^Icon=.*$|Icon=${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
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

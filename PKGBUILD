# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker-beta
pkgname=${_pkgname}-appimage
pkgver=4.0.2
pkgrel=5
pkgdesc="Utility for configuring Wooting keyboards (binary AppImage version)"
arch=('x86_64')
url="https://wooting.io/wootility"
license=('unknown')
depends=('fuse2')
provides=('wootility')
conflicts=('wootility')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-beta.AppImage"
source=(
    "https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-beta/${_appimage}"
    "70-wooting.rules"
    "wooting-xinput@.service"
    "wooting-lekker-xinput@.service"
)
sha512sums=(
    "2ab58acd16d9fa2f56bbbb125b82a1626bfaefa433271b6777041b7390e6f99c473a10264605cbe4b55d21b27eb0a9e10cf6d73b6e9809f792834ef926162c5f"
    "06c3c400d814003aea35762c907df012c116cf31271873d522b8b70e60e089662aa433676ab3e75891aa0cc2a79fd14f458cd119ba0d1c9570ea4a948a633eb0"
    "144506d0ba6d4ddad451274a99493458ebf3136c1b5a37dfcea8e5bededa355184bf7b760854342acb5e34182ef2520cccc1cd4b61a0e1cc539004f397236972"
    "b9327e2565592804a88e58c4f87fb58417327d0ed37628d6f6797b643afe0d9070966c9fcea13857c7fcfb04642b46ac694694a1978381778539fd8e3e6ed456"
)

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_pkgname}.desktop
    ./${_appimage} --appimage-extract ${_pkgname}.png
    ./${_appimage} --appimage-extract usr/share/icons
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop # Modify Exec to $_pkgname
    sed -i -E "s|Name=${_pkgname}|Name=Wootility|" squashfs-root/${_pkgname}.desktop # Modify Name to Wootility
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "${pkgdir}/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname

    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    # Install udev rules and systemd services
    install -Dpm644 "70-wooting.rules" "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
    install -Dpm644 "wooting-xinput@.service" "${pkgdir}/etc/systemd/system/wooting-xinput@.service"
    install -Dpm644 "wooting-lekker-xinput@.service" "${pkgdir}/etc/systemd/system/wooting-lekker-xinput@.service"
}

# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker-beta
pkgname=${_pkgname}-appimage
pkgver=4.3.5
pkgrel=1
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
    "wooting-one-xinput@.service"
    "wooting-two-xinput@.service"
)
sha512sums=(
    "388a7de5b9348ef26479af4874ca7efa5ac5de542c069f957b6d2bcc5cef8255636fafee9c962ac7d54f094afd625472459d1ebeb51a0a603bbea6fddbd8fd6d"
    "822d94a43323216cee6f4cb26646cde62b2feb07b11467371721a0ca189b1046f1a115ffeb6af4e8328a12a0d03cd79196613332761235288d3e7e134bf36eb1"
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
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname

    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dpm644 "squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    # Install udev rules and systemd services
    install -Dpm644 "70-wooting.rules" "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
    install -Dpm644 "wooting-one-xinput@.service" "${pkgdir}/etc/systemd/system/wooting-xinput@.service"
    install -Dpm644 "wooting-two-xinput@.service" "${pkgdir}/etc/systemd/system/wooting-lekker-xinput@.service"
}

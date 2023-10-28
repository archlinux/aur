# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker
pkgname=${_pkgname}-appimage
pkgver=4.6.7
pkgrel=1
pkgdesc="Utility for configuring Wooting keyboards (binary AppImage version)"
arch=('x86_64')
url="https://wooting.io/wootility"
license=('unknown')
depends=('fuse2')
optdepends=('xboxdrv: Analog gamepad support (input group required)')
provides=('wootility')
conflicts=('wootility')
options=(!strip)
install=wooting.install
_appimage="${_pkgname}-${pkgver}.AppImage"
source=(
    "https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-latest/${_appimage}"
    "70-wooting.rules"
)
sha512sums=(
    "2d85db5d8b41ac369bfdead08203a0789edb95eb3cf91b107732c89b63ad8c3d94c0c4ab2e4a0a90686c4c6d5219e5a705cd7323aae119cd195dad0c3367f294"
    "552d3211d99a83b4e59fee5cb1ad70c41846ca7e8306a4065a3c410baeb5befc417c0833add136820f0694150aeba29e9380c5e7bc9ab6a257b686e66baeea29"
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
}

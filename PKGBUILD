# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker-beta
pkgname=${_pkgname}-appimage
pkgver=4.6.5
pkgrel=2
pkgdesc="Utility for configuring Wooting keyboards (binary AppImage version)"
arch=('x86_64')
url="https://wooting.io/wootility"
license=('unknown')
depends=('fuse2')
optdepends=('xboxdrv: Analog gamepad support (input group required)')
provides=('wootility' 'wootility-lekker')
conflicts=('wootility')
options=(!strip)
install=wooting.install
_appimage="${_pkgname}-${pkgver}-beta.AppImage"
source=(
    "https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-beta/${_appimage}"
    "70-wooting.rules"
)
sha512sums=(
    "4ae18e3c37c905a378983d78d136b4f09588385aa2a48661a9a6af823053b39d6d0339e9f6b0b03959242a54179051d47e3d7a42937dcd9f7ad6dbe42ad7767b"
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

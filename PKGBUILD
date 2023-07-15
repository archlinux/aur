# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker
pkgname=${_pkgname}-appimage
pkgver=4.5.5
pkgrel=2
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
    "wooting.rules"
    "wooting-xinput.rules"
    "wooting-xinput@.service"
)
sha512sums=(
    "a3e34eeab7efea9d8f3efb672a902f68869177031326d58edeebc804b4a257eaac545ec603432312684cffdc29b7bdedf51fa2405667ebac9e1fe7764919ad23"
    "8044b9cd8c28d14b8ecf5d9d6f7daf8fd603e586a894fe1cb220d5b6cd6edf48ac98e696d562fd2d72c11262dcb8225d897870e0941acadf8a98bf28c19c2e20"
    "f74379c88438676cd2d071b6092d8122bc8a8bf93fc456e86a6de1c91ec7294864ea45e93e839df8b3bfd08cbdc45401b6b42ba33a03f13acb5851d774b5bdc5"
    "5612170539f68985d133989645601ef1950033b1883bf416368a40274892aca2b8a606bfb30a1482bada20dc7d3695e64bca3b6dba420c65c7c8fa4c7b1e8045"
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
    install -Dpm644 "wooting.rules" "${pkgdir}/usr/lib/udev/rules.d/wooting.rules"
    install -Dpm644 "wooting-xinput.rules" "${pkgdir}/usr/lib/udev/rules.d/wooting-xinput.rules"
    install -Dpm644 "wooting-xinput@.service" "${pkgdir}/usr/lib/systemd/system/wooting-xinput@.service"
}

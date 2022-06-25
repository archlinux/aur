# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker
pkgname=${_pkgname}-appimage
pkgver=4.4.6
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
    "wooting.rules"
    "wooting-xinput.rules"
    "wooting-xinput@.service"
)
sha512sums=(
    "65e88af5b7aea23fa925a5b31545f5b2dcfb044ca63d75e4500d1d480599b6ac1ec57a42f15b7f53ce42e1f52a75cf3f4bcaa98ab3b5850de611cf795e7e918f"
    "c8463344da908f2e984c7b6f72a36402a47766641516fc8ca7de51fefd4c9ceed826d1f10f946fa518f0a9ab039dc1c97c6c5d0bc08688f61293fd78d325edb2"
    "2f679f24d4ddd0fb67fbe363120e8378b172209e36009d0fa4de625a1b5a4c51c7e1d8f54dcbbe0bf1b6044780750ad6ee955883b54670063530fb9490113d32"
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
    install -Dpm644 "wooting-xinput@.service" "${pkgdir}/etc/systemd/system/wooting-xinput@.service"
}

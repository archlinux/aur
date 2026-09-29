# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>

# NOTE: liquidlauncher-bin is the recommended package. It uses the official .deb
# build, needs no fuse2/AppImage runtime and integrates better with the system.

_pkgname=LiquidLauncher
_binname=liquidlauncher

pkgname="liquidlauncher-appimage"
pkgver=0.7.0
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install & update and mod managment."
arch=('x86_64')
url="https://github.com/CCBlueX/LiquidLauncher"
license=('GPL3')
depends=('zlib' 'fuse2')
options=(!strip)
install="${pkgname}.install"
_appimage="${_pkgname}_${pkgver}_amd64.AppImage"
noextract=("${_appimage}")
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage")
sha512sums_x86_64=('ad556fcf7788be31df693a9eb1c7f624af344b2073f7d400701fd28f4879ff365c557dc8d85a34cb6df487519702df7982d20cca3b5f133614257c7e997c570d')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/$_binname"
}


# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>

# NOTE: liquidlauncher-bin is the recommended package. It uses the official .deb
# build, needs no fuse2/AppImage runtime and integrates better with the system.

_pkgname=LiquidLauncher
_binname=liquidlauncher

pkgname="liquidlauncher-appimage"
pkgver=0.6.1
pkgrel=2
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
sha512sums_x86_64=('dc01181352b081cd063a51f92cf2ba41c637434bd0326576718056ce4ec6ec3a4ca80f9c1470ec604e06c2e158cd2360fb52bd6758d073f874bdee5c3bcddf18')

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


# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>

# NOTE: liquidlauncher-bin is the recommended package. It uses the official .deb
# build, needs no fuse2/AppImage runtime and integrates better with the system.

_pkgname=LiquidLauncher
_binname=liquidlauncher

pkgname="liquidlauncher-appimage"
pkgver=0.7.1
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce"
arch=('x86_64' 'aarch64')
url="https://github.com/CCBlueX/LiquidLauncher"
license=('GPL3')
depends=('zlib' 'fuse2')
options=(!strip)
install="${pkgname}.install"
_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_pkgname}-${pkgver}-x86_64.AppImage" "${_pkgname}-${pkgver}-aarch64.AppImage")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/${_pkgname}_${pkgver}_aarch64.AppImage")
sha512sums_x86_64=('d08c9b2ba6edec963f091a9a48d4ac2068de81e51c8f26869dd7009280b1b97bce83615951d86de9179f3c0974d9b77745673e92c26b30e92df909328d32eeac')
sha512sums_aarch64=('f2ad23afec60a4fb74b8184044c57b94d7bcd109477a58854193b869ada864b132433727f4d11559873617463079a95a874d5294aac21908b761cf5b5767558a')

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

    # Wrapper executable; pacman owns updates, the AppImage in /opt is not ours to replace
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_binname}" <<EOF
#!/bin/sh
LIQUIDLAUNCHER_SKIP_UPDATE=1 exec /opt/${pkgname}/${pkgname}.AppImage "\$@"
EOF
}


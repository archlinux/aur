# Maintainer: 1zuna <marco@ccbluex.net>

_pkgname=liquidlauncher

pkgname="${_pkgname}"-appimage
pkgver=0.1.8
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft, written in Rust using Tauri."
arch=('x86_64')
url="https://github.com/CCBlueX/LiquidLauncher"
license=('GPL3')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${_pkgname}_${pkgver}_amd64.AppImage"
noextract=("${_appimage}")
source=("https://github.com/CCBlueX/LiquidLauncher/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage.tar.gz")
sha256sums=('80b8a1654682a762ff67c81978de39ea1446529c49a7d47dc44f30f0dc1971a3')

prepare() {
    tar -xzf "${_appimage}.tar.gz"
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
    #install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}


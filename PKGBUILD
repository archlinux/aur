# Maintainer: Patrykf03 <hamachi0912@gmail.com>

_pkgname=yuzu-ea-bin

pkgname=yuzu-ea-bin
pkgver=1068
pkgrel=1
pkgdesc="Yuzu switch emulator Early Access build for Arch Linux"
arch=('x86_64')
url="https://github.com/pineappleEA/pineappleEA.github.io"
license=('gpl')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
pkgver=1068
pkgver=1068
noextract=("${_appimage}")
sha256sums_x86_64=('47f86b02e1e8c24a6f16397f7a7cca0039f9567922bd9c8aa3ee9f518cef0615')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}


build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/yuzu.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/yuzu.desktop"\
            "${pkgdir}/usr/share/applications/yuzu.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/yuzu"
}

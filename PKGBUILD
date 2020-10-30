# Maintainer: Patrykf03 <hamachi0912@gmail.com>

pkgname=yuzu-ea-bin
pkgver=1088
pkgrel=1
pkgdesc="Yuzu switch emulator Early Access build for Arch Linux"
arch=('x86_64')
url="https://github.com/pineappleEA/pineappleEA.github.io"
license=('gpl')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
source_x86_64=("https://github.com/pineappleEA/pineappleEA.github.io/releases/download/EA-${pkgver}/Yuzu-EA-${pkgver}.AppImage")
noextract=("Yuzu-EA-${pkgver}.AppImage")
sha256sums_x86_64=('1a22f3b6c8743d86c01ca3e99dce4610e084eee3a946a1c17b1398cd0998a1d0')

prepare() {
    chmod +x "Yuzu-EA-${pkgver}.AppImage"
    ./"Yuzu-EA-${pkgver}.AppImage" --appimage-extract
}



build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "squashfs-root/yuzu.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/Yuzu-EA-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/Yuzu-EA-${pkgver}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/yuzu.desktop"\
            "${pkgdir}/usr/share/applications/yuzu.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Yuzu-EA-${pkgver}.AppImage" "${pkgdir}/usr/bin/yuzu"
}

# Maintainer: Matthew Blankenbehler <spectrino3d@gmail.com>
# Maintainer: Marius Žukaitis <marius.zukaitis@gmail.com>

_pkgname=satisfactory-mod-manager

pkgname="${_pkgname}"-appimage
pkgver=3.0.3
pkgrel=1
pkgdesc="Satisfactory Mod Manager (appimage)"
arch=('x86_64')
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
_appimage="SatisfactoryModManager_linux_amd64.AppImage"
source=("https://github.com/satisfactorymodding/SatisfactoryModManager/releases/download/v${pkgver}/${_appimage}"
        "https://raw.githubusercontent.com/satisfactorymodding/SatisfactoryModManager/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums=('3cdf48a866522e0ba0e9880080d28c9925f456580119cfc08f562a90f1ea2d16'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
conflicts=('satisfactory-mod-manager' 'satisfactory-mod-manager-git')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=SatisfactoryModManager|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/SatisfactoryModManager.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/SatisfactoryModManager.desktop"\
            "${pkgdir}/usr/share/applications/SatisfactoryModManager.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

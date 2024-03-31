# Maintainer: Conor Burns <mail@conor-burns.com>

pkgname=pog-appimage
pkgver=1.2.5
pkgrel=1
pkgdesc="A Kmk firmware flashing and configuration tool"
arch=('x86_64')
url="https://github.com/JanLunge/pog"
license=('MIT')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/JanLunge/pog/releases/download/v${pkgver}/pog-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha512sums_x86_64=('6703e0f54375fd3893d9b6eaca7c1f800869b0eb9d81cebfab17ee0948840063c7162639529161c04a9d0a42a470befc0d033b4debaa68214da1d22a7245bae4')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/pog|"\
        "squashfs-root/pog.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/pog/pog.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/pog.desktop"\
            "${pkgdir}/usr/share/applications/pog.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/pog/pog.AppImage" "${pkgdir}/usr/bin/pog"
}

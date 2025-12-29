# Maintainer: Aaron Ky-Riesenbach <archaur.carve665@passmail.net>

_basename=Strum-Machine

pkgname=strum-machine
pkgver=1.1.2
pkgrel=1
pkgdesc="Official Electron wrapper for Strum Machine"
arch=('x86_64')
url="strummachine.com"
options=(!strip)
_appimage="${_basename}-${pkgver}-${arch[0]}.AppImage"
source_x86_64=("${_appimage}::https://dl.todesktop.com/2311067sn5jju9o/linux/appImage/x64")
noextract=("${_appimage}")
sha256sums_x86_64=('b162e41b43f5547b09f4b1b7ca83e6f20cc5223e04095cb9af654ab9ef152a48')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "squashfs-root/${_basename}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_basename}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

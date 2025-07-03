# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Paul Sauve <paul@technove.co>

_pkgname=actual
_Pkgname=Actual

pkgname=${_pkgname}-appimage
pkgver=v25.7.1
pkgrel=1
pkgdesc="Actual Budget is a local-first personal finance tool. It is 100% free and open-source, written in NodeJS, it has a synchronization element so that all your changes can move between devices without any heavy lifting."
arch=('x86_64')
url="https://actualbudget.org/"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_Pkgname}-linux-${arch}.AppImage"
source_x86_64=("${_appimage}::https://github.com/actualbudget/${_pkgname}/releases/download/${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('2c1edfbcfe1d6e11d4b3369f5e6baa87e2ab7cbcbc4eb7786ce90f9c0245c076')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/desktop-electron.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_Pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/desktop-electron.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_Pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

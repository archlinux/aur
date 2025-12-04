# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Dillan Mills <archlinux@dillan.org>
# Contributor: Paul Sauve <paul@technove.co>

_pkgname=actual
_Pkgname=Actual

pkgname=${_pkgname}-appimage
pkgver=v25.12.0
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
sha256sums_x86_64=('a13ab7b10972a29628de1c14ece9844d4a258a810337f973dc53836015110068')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/actual.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_Pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/actual.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_Pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname="openutau"

pkgname="${_pkgname}"
pkgver=0.0.517
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-prerelease-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/OpenUtau-Latest/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('571824f765a566105cebac63de4242633c9041045e2e2943a3a9b49c2af9b0c5')
options+=('!strip')

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
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

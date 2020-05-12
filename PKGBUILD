# Maintainer: Daniel Mason <daniel@m2.nz>
_pkgname=digikam-beta
pkgname="${_pkgname}"-appimage
pkgdesc="Professional Photo Management with the Power of Open Source."
pkgver=v7.0.0.3
pkgrel=1
arch=('x86_64')
url="https://www.digikam.org/"
license=('GPL')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://download.kde.org/unstable/digikam/digikam-7.0.0-beta3-20200422T062854-x86-64.appimage")
noextract=("${_appimage}")
sha256sums_x86_64=('79b6a277a1ccb7a80db8b60055b603c9a3ec2f333c8fc8e5fb9faac22c43f2b1')
conflicts=('digikam' 'digikam-git' 'digikam-beta')
provides=('digikam-beta')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/org.kde.digikam.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.kde.digikam.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
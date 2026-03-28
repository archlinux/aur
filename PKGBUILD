# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: programegg <monocrystalmonkey@protonmail.com>

_pkgname=snapmaker-orca
_Pkgname=Snapmaker_Orca

pkgname="${_pkgname}"-appimage
pkgver=2.3.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/Snapmaker/OrcaSlicer/"
license=('AGPL-3.0-only')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('snapmaker-orca')

_appimage="${pkgname}-${pkgver}_Beta.appimage"
source_x86_64=("${_appimage}::https://github.com/Snapmaker/OrcaSlicer/releases/download/v${pkgver}/${_Pkgname}_Linux_AppImage_Ubuntu2404_V${pkgver}_Beta.AppImage"
               "LICENSE::https://raw.githubusercontent.com/Snapmaker/OrcaSlicer/refs/heads/main/LICENSE.txt"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('d3676edc0e5385deb537a44e87496a4c7b631007884bad5234dcc4f5c8d8b09b'
                   '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
                  )

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_Pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_Pkgname}.desktop"

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

# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: programegg <monocrystalmonkey@protonmail.com>

_pkgname=snapmaker-orca
_Pkgname=Snapmaker_Orca

pkgname="${_pkgname}"-appimage
pkgver=2.3.5
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/Snapmaker/OrcaSlicer/"
license=('AGPL-3.0-only')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'webkit2gtk-4.1')
makedepends=('unzip')
provides=('snapmaker-orca')

_ziparchive="${pkgname}-${pkgver}_archive.zip"
source_x86_64=("${_ziparchive}::https://github.com/Snapmaker/OrcaSlicer/releases/download/v${pkgver}/Snapmaker_Orca_Linux_ubuntu_2404_V${pkgver}.zip"
               "LICENSE::https://raw.githubusercontent.com/Snapmaker/OrcaSlicer/refs/heads/main/LICENSE.txt"
              )
noextract=("${_ziparchive}")
sha256sums_x86_64=('2b361ed9c70e2e45e1fa56bc1d2d0d141d951eccfad91f227973a7acb64994bb'
                   '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
                  )

prepare() {
    unzip "${_ziparchive}" -d ./
    chmod +x "Snapmaker_Orca_Linux_AppImage_Ubuntu2404_V${pkgver}.AppImage"
    ./"Snapmaker_Orca_Linux_AppImage_Ubuntu2404_V${pkgver}.AppImage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/io.github.Snapmaker.Snapmaker_Orca.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/Snapmaker_Orca_Linux_AppImage_Ubuntu2404_V${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/io.github.Snapmaker.Snapmaker_Orca.desktop"\
            "${pkgdir}/usr/share/applications/io.github.Snapmaker.Snapmaker_Orca.desktop"

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

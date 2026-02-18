# Maintainer: Elia Elmas <eliaelmas at proton dot me>
_pkgname=onthespot
pkgname="$_pkgname-appimage"
pkgver=1.2.2beta
pkgrel=1
pkgdesc="A GUI music downloader for Apple Music, Bandcamp, Deezer, Qobuz, Spotify, Tidal, and Youtube"
arch=('x86_64')
url="https://github.com/justin025/onthespot"
license=('GPL-2.0-only')
depends=('glibc' 'zlib' 'libarchive' 'fuse2' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_appimagezip="${pkgname}-${pkgver}.AppImage.zip"
_appimage="OnTheSpot-x86_64.AppImage"
source=("${_appimagezip}::https://github.com/justin025/onthespot/releases/download/v${pkgver}/OnTheSpot-x86_64.AppImage.zip" "https://raw.githubusercontent.com/justin025/onthespot/refs/tags/v${pkgver}/LICENSE")
noextract=("${_appimagezip}")
md5sums=('2f230633ab3fc2dd43aa48841a588792' '267d14867132fa03d20ea4c695c31e8c')


prepare() {
    # Extract the AppImage
    bsdtar -xf "${_appimagezip}"   
    # Make the AppImage executable
    chmod +x "${_appimage}"
    # Extract the relavent files for the build
    ./"${_appimage}" --appimage-extract
}


build() {
    # Fix .desktop file entry to work outside the AppImage
    awk 'NR==7 {$0="Exec=onthespot"} 1' "squashfs-root/org.onthespot.OnTheSpot.desktop" > "squashfs-root/${_pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}



package() {
    # Move the AppImage into the correct folder
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Move the desktop file into the correct folder
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Move the icon into the correct folder
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    cp -a "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    # Symlink the executable to the AppImage
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink the license
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

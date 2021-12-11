# Contributor: David Anderegg <dd.anderegg@hotmail.com>

# BUILD INSTRUCTIONS:
# -------------------
#
# This software has to be purchased. Due to that, this package only provides a
# skeleton.
#
# You have to aquire the File 'Video Hub App 3-3.1.0.AppImage' by yourself and
# place it in the same folder as this PKGBUILD lies. Please note that the demo
# file does not work

_pkgname=video-hub-app
pkgname="${_pkgname}"-appimage
pkgver=3.1.0
pkgrel=1
pkgdesc="Video Hub App 3 is the fastest way to browse and search for videos on your computer. Think of it like YouTube for videos on your computer: browse, search, and preview. Works on Windows, Mac, and Linux!"

arch=('x86_64')
url="https://github.com/whyboris/Video-Hub-App"
license=('MIT')
# depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="Video Hub App 3-${pkgver}.AppImage"
_desktop="video-hub-app-3"
source_x86_64=("${_appimage[@]/#/file://}")
noextract=("${_appimage}")
sha256sums_x86_64=('81384d6754848bc3183eeb17d239fe3962959c015ffa9aedae76add6bf3db35f')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_desktop}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktop}.desktop"\
            "${pkgdir}/usr/share/applications/${_desktop}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

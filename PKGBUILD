# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
_pkgname=yangdownloader
pkgname=${_pkgname}-appimage
pkgver=2.2
pkgrel=1
pkgdesc="Downloads best-quality audio and video from YouTube"
arch=('x86_64')
url="https://github.com/mysteryx93/HanumanInstituteApps/wiki/Yang-YouTube-Downloader"
license=('MIT')
depends=('ffmpeg')

options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/HanumanInstituteApps/releases/download/v${pkgver}/YangDownloader-${pkgver}_Linux_x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('c1e3d50cc71b69a4576298228010dacb3cf104a73bec88a8ee5c594168560f15')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
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
    #install -dm755 "${pkgdir}/usr/share/"
    #cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

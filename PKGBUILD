# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
AppName=YangDownloader
appid=yangdownloader
pkgname=${appid}-appimage
pkgver=3.3.2
pkgrel=1
pkgdesc="Downloads best-quality audio and video from YouTube"
arch=('x86_64')
url="https://github.com/mysteryx93/HanumanInstituteApps/wiki/Yang-YouTube-Downloader"
license=('MIT')
depends=('ffmpeg')

options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/HanumanInstituteApps/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('cd146aba873d195883d61671c773bff9de9a0067cba3a61a8dbd53b8780528d9')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed -i "s/\/${AppName}/\/${appid}/g" "${srcdir}/squashfs-root/${appid}.desktop"
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appid} %u|"\
        "squashfs-root/${appid}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${appid}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appid}.desktop"\
            "${pkgdir}/usr/share/applications/${appid}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${appid}.AppImage" "${pkgdir}/usr/bin/${appid}"
}

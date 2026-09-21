# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
AppName=SynthMultiViewer
appid=synthmultiviewer
pkgname=${appid}-appimage
pkgver=1.4
pkgrel=1
pkgdesc="Cross-platform editor and viewer for VapourSynth and AviSynth"
arch=('x86_64' 'aarch64')
url="https://github.com/mysteryx93/VapourSynthViewer.NET"
license=('MIT')
optdepends=(
    'vapoursynth: VapourSynth script preview'
    'avisynthplus: AviSynth script preview'
)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/VapourSynthViewer.NET/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_x64.AppImage")
source_aarch64=("${_appimage}::https://github.com/mysteryx93/VapourSynthViewer.NET/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_arm64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('e48ec3d8e4b1ad54ba5cb467b00238a780105b72e86090b9f4738e8b74db278c')
sha256sums_aarch64=('e48ec3d8e4b1ad54ba5cb467b00238a780105b72e86090b9f4738e8b74db278c')

prepare() {
    chmod +x "${_appimage}"
    export APPIMAGE_EXTRACT_AND_RUN=1
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

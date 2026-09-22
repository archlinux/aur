# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
AppName=SynthMultiViewer
appid=synthmultiviewer
pkgname=${appid}-appimage
pkgver=1.4
pkgrel=1.2
pkgdesc="Cross-platform editor and viewer for VapourSynth and AviSynth"
arch=('x86_64' 'aarch64')
url="https://github.com/mysteryx93/SynthMultiViewer"
license=('MIT')
optdepends=(
    'vapoursynth: VapourSynth script preview'
    'avisynthplus: AviSynth script preview'
)
options=(!strip)
# pkgrel is part of the local name so a rebuild does not reuse a cached AppImage from the previous pkgrel.
_src_x86_64="${pkgname}-${pkgver}-${pkgrel}-x86_64.AppImage"
_src_aarch64="${pkgname}-${pkgver}-${pkgrel}-aarch64.AppImage"
source_x86_64=("${_src_x86_64}::https://github.com/mysteryx93/SynthMultiViewer/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_x64.AppImage")
source_aarch64=("${_src_aarch64}::https://github.com/mysteryx93/SynthMultiViewer/releases/download/v${pkgver}/${AppName}-${pkgver}_Linux_arm64.AppImage")
noextract=("${_src_x86_64}" "${_src_aarch64}")
sha256sums_x86_64=('14230fddd14e8b36213e8b5a1a780d1ec95ad8de1bb4711a713b000f590cc80c')
sha256sums_aarch64=('211cab4eabf9fdfcb922fe82a6b0bd7db2d98ff077b9d53e5d55169e41a882b7')

_appimage() {
    case "$CARCH" in
        aarch64) printf '%s\n' "${_src_aarch64}" ;;
        *) printf '%s\n' "${_src_x86_64}" ;;
    esac
}

prepare() {
    chmod +x "$(_appimage)"
    export APPIMAGE_EXTRACT_AND_RUN=1
    ./"$(_appimage)" --appimage-extract
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
    install -Dm755 "${srcdir}/$(_appimage)" "${pkgdir}/opt/${pkgname}/${appid}.AppImage"

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

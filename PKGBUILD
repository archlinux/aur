# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
_pkgname=musescore
pkgname=musescore-bin
pkgver=4.7.5
pkgrel=2
pkgdesc='Create, play and print beautiful sheet music / AppImage version'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
_appimage="MuseScore-Studio-${pkgver}.260831071-x86_64.AppImage"
noextract=("${_appimage}")
depends=(zlib fuse2)
optdepends=('lame: MP3 export')
provides=('musescore')
conflicts=(
    'musescore'
    'musescore-git'
)
options=(!strip !debug)
source=(
    "${_appimage}::https://github.com/musescore/MuseScore/releases/download/v${pkgver}/${_appimage}"
    "mscore.sh"
)
sha256sums=('a31b2da2dbcc2191bcc98beb7be5c15f2f517bedb3444def96fe3088b74d3a1e'
            'd9bb8cf15e9bea1533461ab094f29029ffbe21e820accd205f9552c3545057bc')
appname="mscore"

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    # LD_PRELOAD to fix ffmpeg library incompatibility with the AppImage
    sed -i -E "s|Exec=.*|Exec=/usr/bin/${appname} %U|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"
    # Remove "Portable" from the application name
    sed -i -E "s|Name=MuseScore Studio.*|Name=MuseScore Studio ${pkgver}|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"
    # We need to match the WMClass of the AppImage which is different from the provided desktop file
    sed -i -E "s|StartupWMClass=.*|StartupWMClass=mscore4portable|"\
        "squashfs-root/org.musescore.MuseScore4portable.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.musescore.MuseScore4portable.desktop"\
            "${pkgdir}/usr/share/applications/org.musescore.MuseScore4portable.desktop"

    # MIME type definitions (.mscz/.mscx/MusicXML/... — fixes .mscz being detected as zip)
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/musescore4portable.xml"\
            "${pkgdir}/usr/share/mime/packages/musescore4portable.xml"

    # AppStream metadata
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/org.musescore.MuseScore4portable.appdata.xml"\
            "${pkgdir}/usr/share/metainfo/org.musescore.MuseScore4portable.appdata.xml"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin/"
    install -D -m 0755 "${srcdir}/mscore.sh" "${pkgdir}/usr/bin/mscore"
}


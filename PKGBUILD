# Maintainer: Mason Jones <myemail@domain.me>

_pkgname=loopauditioneer
_pkgname_orig=LoopAuditioneer
_pkgver_maj_min=0.9

pkgname="${_pkgname}"-appimage
pkgver=0.9.66
pkgrel=1
pkgdesc="Software for loop and cue handling in .wav files."
arch=('x86_64')
url="https://sourceforge.net/projects/loopauditioneer/"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://sourceforge.net/projects/loopauditioneer/files/LoopAuditioneer-${_pkgver_maj_min}/LoopAuditioneer-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('3bc78e025eefc6ed4491acd7d7baa22e9dbf2f52475e9bd97c615e6009c1ff30')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container (and with the bin rename)
    sed -i -E "s|Exec=LoopAuditioneer|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname_orig}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname_orig}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname_orig}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname_orig}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname_orig}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

# Maintainer: Mason Jones <myemail@domain.me>

_pkgname=loopauditioneer
_pkgname_orig=LoopAuditioneer

pkgname="${_pkgname}"-appimage
pkgver=0.11.0
pkgrel=1
pkgdesc="Software for loop and cue handling in .wav files."
arch=('x86_64')
url="https://github.com/GrandOrgue/LoopAuditioneer"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/GrandOrgue/LoopAuditioneer/releases/download/v${pkgver}/LoopAuditioneer-${pkgver}.x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('ee414eefd08abbcb2eb86b50228f4570408929de4e1ec0e89d43cd8b63f034a2')

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

# Maintainer: Max van Gent <max.vangent@gmail.com>

_pkgname=plover

pkgname="${_pkgname}"-appimage
pkgver=5.3.0
pkgrel=1
pkgdesc="Free and open source real-time stenography engine"
arch=('x86_64')
url="https://opensteno.org/plover/"
license=('GPL-2.0-or-later')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/openstenoproject/plover/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('8bd49513a2f0a4914bc73fe405c6a8ba951d58d3d13f420ea035e08647032778')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
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
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

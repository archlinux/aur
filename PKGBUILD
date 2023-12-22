# Maintainer: Glucy2<glucy-2@outlook.com>

_pkgname=sast-evento

pkgname="${_pkgname}"-appimage
pkgver="1.0.1222"
pkgrel=2
pkgdesc="An event management system developed and used by NJUPT SAST"
arch=('x86_64')
url="https://github.com/NJUPT-SAST/SAST-Evento-Desktop"
license=('MIT')
depends=('fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=(
    "${_appimage}::https://github.com/NJUPT-SAST/SAST-Evento-Desktop/releases/download/${pkgver}/sast-evento_appimage_x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/NJUPT-SAST/SAST-Evento-Desktop/${pkgver}/LICENSE"
)
noextract=(${_appimage})
sha256sums_x86_64=('27aea397e04f43b63e740feb6e3e3caf2254140b424ec95817bff5513a2f33b0'
    'dd961254a4f3599af88f965689f9e75674a300267df4e2110028c56724338a12')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop"\
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

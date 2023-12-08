# Maintainer: Glucy2<glucy-2@outlook.com>

_pkgname=sast-evento

pkgname="${_pkgname}"-appimage
pkgver="1.0.1208"
pkgrel=1
pkgdesc="An event management system developed and used by NJUPT SAST"
arch=('x86_64')
url="https://sast.fun"
license=('MIT')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=(
    "${_appimage}::https://github.com/NJUPT-SAST-Cpp/SAST-Evento-Desktop/releases/download/${pkgver}/sast-evento_appimage_x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/NJUPT-SAST-Cpp/SAST-Evento-Desktop/${pkgver}/LICENSE"
)
noextract=(${_appimage})
sha256sums_x86_64=('a48e9686a383c4cd04405ae71608494a6dca36cf23108fdb3f12a8c3603c94fa'
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

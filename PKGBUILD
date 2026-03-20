# Maintainer: ava1ar <mail at ava1ar dot me>

_pkgname=QIDIStudio

pkgname=qidi-studio-appimage
pkgver=2.05.01.52
pkgrel=1
pkgdesc="QIDIStudio is a professional 3D printer slicing software for QiDi 3D printers (AppImage version)"
arch=('x86_64')
url="https://github.com/QIDITECH/QIDIStudio"
license=('GPL-3.0-only')
depends=('zlib' 'fuse2' 'webkit2gtk-4.1')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/QIDITECH/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v0${pkgver}_Ubuntu24.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('6e342c2d6b81700f6b5b05fc5080a087448a277cd07b5a1959ca9fedbba87ba1')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=.*$|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname"
}

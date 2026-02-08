# Maintainer: ava1ar <mail at ava1ar dot me>

_pkgname=nanokvm-usb

pkgname="${_pkgname}"-appimage
pkgver=1.1.4
pkgrel=1
pkgdesc="NanoKVM USB Host Application (AppImage version)"
arch=('x86_64')
url="https://github.com/sipeed/NanoKVM-USB"
license=('GPL-3.0-only')
depends=('zlib' 'fuse2')
options=(!strip)
install=${pkgname}.install
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/sipeed/NanoKVM-USB/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage"
               "https://raw.githubusercontent.com/sipeed/NanoKVM-USB/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums_x86_64=('d34313e14d9a7efd2ab77c455612ebd124a64b670baca06599fcea60416e6957'
                   '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

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
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

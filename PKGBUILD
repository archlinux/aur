# Maintainer: ava1ar <mail at ava1ar dot me>

_pkgname=nanokvm-usb

pkgname="${_pkgname}"-appimage
pkgver=1.0.1
pkgrel=1
pkgdesc="NanoKVM USB Host Application (AppImage version)"
arch=('x86_64')
url="https://github.com/sipeed/NanoKVM-USB"
license=('GPL-3.0-only')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/sipeed/NanoKVM-USB/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
               "https://raw.githubusercontent.com/sipeed/NanoKVM-USB/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('48e4643ea0a90ea2ced0c00029c7ad8f9631909307e3eb62a8cf5cb5f36e9526'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

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

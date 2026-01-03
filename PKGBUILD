# Maintainer: ava1ar <mail at ava1ar dot me>

_pkgname=openterfaceqt

pkgname="${_pkgname}"-appimage
pkgver=0.5.7
pkgrel=1
pkgdesc="Openterface Mini-KVM Host Application (AppImage version)"
arch=('x86_64')
url="https://github.com/TechxArtisanStudio/Openterface_QT"
license=('GPL-3.0-only')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/TechxArtisanStudio/Openterface_QT/releases/download/${pkgver}/openterfaceQT_linux_amd64.AppImage"
               "https://raw.githubusercontent.com/TechxArtisanStudio/Openterface_QT/${pkgver}/LICENSE"
               "51-openterface.rules"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('2468085a0e74e73c34c837ce04c153d54ebbd0d86d6931d27262e13e5f219c9b'
                   '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
                   'c2b3f7e0ad8456d3e6f85931986f4b624687bf15309eaba0c6ab1685cf75d89d')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=[A-Za-z]*$|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
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
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname"

    # Udev rules
    install -Dm644 "${srcdir}/51-openterface.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
}

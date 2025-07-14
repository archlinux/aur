# Maintainer: Paul Sauve <paul@technove.co>

_pkgname=raycast-linux

pkgname="${_pkgname}"-appimage
pkgver=0.1.0
pkgrel=1
pkgdesc="An open-source, Raycast-inspired launcher for Linux"
arch=('x86_64')
url="https://github.com/ByteAtATime/raycast-linux"
license=('MIT')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}_amd64.AppImage"
source_x86_64=("${_appimage}::https://github.com/ByteAtATime/raycast-linux/releases/download/v${pkgver}-alpha/${_pkgname}_${pkgver}_amd64.AppImage"
               "https://raw.githubusercontent.com/ByteAtATime/raycast-linux/main/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('0ea44e0c3b623395fcd2033debb545ce6acf8de72914f80389d0a1d11aab281a'
                   'bbf2463a9c1da2b25365398dbe7ff15694eb7e700c7185194fdc9a7a21a6f786')

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

# Maintainer: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=ipfs-desktop
pkgname="${_pkgname}"-appimage
pkgver=0.27.0
pkgrel=1
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Linux."
arch=('x86_64')
url="https://github.com/ipfs/ipfs-desktop"
license=('MIT')
provides=('ipfs-desktop')
conflicts=('ipfs-desktop')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-linux-${arch}.AppImage"

source=(
        "https://github.com/ipfs/ipfs-desktop/releases/download/v${pkgver}/${_appimage}"
        "${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ipfs/${_pkgname}/v${pkgver}/LICENSE"
        )

b2sums=(
        '9635fe692ef2d434f04bab2cd306c874192f7f62db7976310ced6acad7331d69710b793dc59e213c69ec163fefb25168c0597679e5b7915e43375b709aaa1a3a'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d'
        )

noextract=("${_appimage}")

prepare() {
    # Bypass integration
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract &>/dev/null
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
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}-${pkgver}-LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons"
    cp "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

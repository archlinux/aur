# Maintainer: digital_mystik <dgtl_mystik at protonmail dot ch>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=electrum
pkgname="${_pkgname}"-appimage
pkgver=4.3.0
pkgrel=1
pkgdesc="Electrum Bitcoin wallet with bundled libraries"
arch=('x86_64')
url="https://electrum.org"
license=('MIT')
provides=('electrum')
conflicts=('electrum' 'electrum-git')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-${arch}.AppImage"
validpgpkeys=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

source=("https://download.electrum.org/${pkgver}/${_appimage}"
        "${_appimage}.asc::https://download.electrum.org/${pkgver}/${_appimage}.ThomasV.asc"
        "${_pkgname}-${pkgver}-LICENCE::https://raw.githubusercontent.com/spesmilo/${_pkgname}/${pkgver}/LICENCE"
        )

b2sums=('fa5b09212cd8993cc4f8e95d3057be835aeee8601011637328471a2f8ac9bebc9f1dc05fa283f1fa0c7e245d3d33621aa52b5b82d523875f504fe7755a7135c6' 
        'SKIP' 
        'a70dea849f4af001369ba2d35bc79c86d8212f0511f86d6f86f88ba0372ba72ef2ef9e2cee176ca5c85cd8c7fd65a95ed388d11cfb8314252d9c8a7ab66c6110')

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
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}-${pkgver}-LICENCE"

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

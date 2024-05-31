# Maintainer: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=electrum
pkgname="${_pkgname}"-appimage
pkgver=4.5.5
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

b2sums=('381cb262344f539b9baca8a7418ecd6f1c16c43f1440363422077ebd73c0e042374307289dae136796b7b922ee8e0de735ba5c3057a6a9fae9e1cda4a5b169ba'
        'SKIP' 
        '8e30e92bffb9b3c518bb106c23cbab40ceb9a1dace193bdbd7e979fa8116e76b47dfc99c5361020c58a7d0bb7de236e6dd7d8f3dfdb1b7fd16245135d53cec3f')

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

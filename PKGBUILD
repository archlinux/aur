# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

_pkgname=carton

pkgname="${_pkgname}"-appimage
pkgver=0.5.0 # renovate: datasource=github-tags depName=821869798/carton
pkgrel=1
pkgdesc="A Windows and Linux GUI client for sing-box.(主打高性能和易用性，非electron tauri等web套皮)"
arch=('x86_64' 'aarch64')
url="https://github.com/821869798/carton"
license=('GPL-3.0')
depends=('zlib' 'fuse2' 'hicolor-icon-theme')
provides=("${_pkgname}")
options=('!strip')
_appimage_x86_64="${_pkgname}-${pkgver}-linux-x64.AppImage"
_appimage_aarch64="${_pkgname}-${pkgver}-linux-arm64.AppImage"
source=("LICENSE::https://raw.githubusercontent.com/821869798/carton/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_appimage_x86_64}::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage")
source_aarch64=("${_appimage_aarch64}::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.AppImage")
noextract=("${_appimage_x86_64}" "${_appimage_aarch64}")
sha256sums=('d0f7cd798fd03274d6742245e320bbd2133dfdb7161c4470df4ea862b4fa57dd')
sha256sums_x86_64=('72ef24c3ef67c64cad7a4627ca81c97188a82599d589697baf4cff10893d80ec')
sha256sums_aarch64=('35e32ceb3c4cc7e078b10ba6e3e30ddec3199a01d179bda068fd8caa4c708fe4')

prepare() {
    case "${CARCH}" in
        x86_64)  _appimage="${_appimage_x86_64}" ;;
        aarch64) _appimage="${_appimage_aarch64}" ;;
    esac
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
    case "${CARCH}" in
        x86_64)  _appimage="${_appimage_x86_64}" ;;
        aarch64) _appimage="${_appimage_aarch64}" ;;
    esac

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/icons"
    cp "${srcdir}/squashfs-root/carton.png" "${pkgdir}/usr/share/icons"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

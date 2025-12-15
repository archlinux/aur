# Maintainer : konez2k <konez at protonmail dot com>

_pkgname=gittyup

pkgname="${_pkgname}-appimage"
pkgver=2.0.0
pkgrel=1
pkgdesc="Graphical Git client (GitAhead fork)"
arch=('x86_64')
url="https://github.com/Murmele/Gittyup"
license=('MIT')
depends=('zlib' 'fuse2')
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/Murmele/Gittyup/releases/download/gittyup_v${pkgver}/Gittyup-${pkgver}-${CARCH}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('fe2ba8db465c809c35ab7d369058556b98b07b0c9a80900617b3e0b5fc6e6281')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|" \
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "./${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/$_pkgname.png" "${pkgdir}/usr/share/pixmaps"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

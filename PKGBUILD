# Maintainer: Angelo Gazzola <(firstname) @ nglgzz.com>
_pkgname=neo4j-desktop
pkgname=neo4j-desktop-1
pkgver=1.6.3
pkgrel=1
pkgdesc="GUI for managing local and remote Neo4j Graph databases"
arch=('x86_64')
url=http://neo4j.org/
license=(custom)
depends=('fuse')
optdepends=('gnome-keyring: Adds support for storing secrets')
options=(!strip)
_appimage="${_pkgname}-offline-${pkgver}-${CARCH}.AppImage"
source=("${_appimage}::https://neo4j.com/artifact.php?name=${_appimage}")
noextract=("${_appimage}")
md5sums=('a127b337c76b6a7907d5a6da87dda038')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside AppImage container
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${_pkgname}.desktop"

    # Adjust .desktop name and icon to not conflict with Neo4j Desktop 2
    sed -i -E "s|Name=Neo4j Desktop$|Name=Neo4j Desktop 1|" "squashfs-root/${_pkgname}.desktop"
    sed -i -E "s|Icon=neo4j-desktop$|Icon=neo4j-desktop-1|" "squashfs-root/${_pkgname}.desktop"

    # Rename icons to not conflict with Neo4j Desktop 2
    rename --last "${_pkgname}.png" "${pkgname}.png" squashfs-root/usr/share/icons/hicolor/*/apps/${_pkgname}.png

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -n "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

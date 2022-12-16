# Maintainer: Angelo Gazzola <(firstname) @ nglgzz.com>
pkgname=neo4j-desktop
pkgver=1.5.6
pkgrel=1
pkgdesc="GUI for managing local and remote Neo4j Graph databases"
arch=('x86_64')
url=http://neo4j.org/
license=(custom)
depends=('fuse')
optdepends=('gnome-keyring: Adds support for storing secrets')
options=(!strip)
_appimage="${pkgname}-offline-${pkgver}-${CARCH}.AppImage"
source=("${_appimage}::https://neo4j.com/artifact.php?name=${_appimage}")
noextract=("${_appimage}")
md5sums=('6be9324e7834d08df98ee6e5cb87108c')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside AppImage container
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${pkgname}.desktop" \
        "squashfs-root/${pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -n "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

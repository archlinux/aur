# Maintainer: Lia Bertran Roca <lia@bertran.xyz>

_pkgname=neo4j-desktop
pkgname=neo4j-desktop-2
pkgver=2.1.4
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
md5sums=('e374e3d9bf8dc42e9bc1251461d5be69')
conflicts=("${_pkgname}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside AppImage container
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop" \
        "squashfs-root/${_pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -n "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

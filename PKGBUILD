_pkgname=owte
pkgname="${_pkgname}-appimage"
pkgver=1.0.1
pkgrel=1
pkgdesc="Anime girl dancing on your screen"
arch=('x86_64')
url="https://github.com/sumit-poudel/oWtE"
license=('custom')
depends=('nss' 'zlib' 'hicolor-icon-theme' 'fuse-common' 'fuse2' 'fuse3')
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/sumit-poudel/oWtE/releases/download/v${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('3ddc6d08bdba8df60823ac117b40f35be0575cc2bde3e414fcc1297b0dbb9529')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    # Extract the AppImage
    "${srcdir}/${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop file to use system-installed executable
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" \
        "${srcdir}/squashfs-root/${_pkgname}.desktop"

    # Fix permissions for installed icons and binaries
    chmod -R a-x+rX "${srcdir}/squashfs-root/usr"
}

package() {
    # Install AppImage to /opt
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Install .desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install main icon from .DirIcon (resolves symlink)
    install -Dm644 "${srcdir}/squashfs-root/.DirIcon" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Optional: copy full hicolor icons for theme support
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
    gtk-update-icon-cache -f -t "${pkgdir}/usr/share/icons/hicolor" || true

    # Create symlink in /usr/bin to the AppImage
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}

